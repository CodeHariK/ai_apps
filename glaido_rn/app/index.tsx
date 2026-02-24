import React, { useEffect } from 'react';
import { View, Text, TouchableOpacity, Image } from 'react-native';
import { MaterialIcons } from '@expo/vector-icons';
import Animated, {
    useSharedValue,
    useAnimatedStyle,
    withRepeat,
    withTiming,
    Easing,
    withSequence,
} from 'react-native-reanimated';
import { useSafeAreaInsets } from 'react-native-safe-area-context';
import { Stack, router } from 'expo-router';
import Header from '../components/Header';
import VoiceBars from '../components/VoiceBars';

export default function VoiceTranscriptionScreen() {
    const insets = useSafeAreaInsets();

    // Outer circle spin
    const spinRotation = useSharedValue(0);
    const spinRotationReverse = useSharedValue(0);

    useEffect(() => {
        spinRotation.value = withRepeat(
            withTiming(360, { duration: 10000, easing: Easing.linear }),
            -1, // Infinite
            false // Do not reverse
        );
        spinRotationReverse.value = withRepeat(
            withTiming(-360, { duration: 15000, easing: Easing.linear }),
            -1,
            false
        );
    }, []);

    const animatedStyleOuter = useAnimatedStyle(() => ({
        transform: [{ rotate: `${spinRotation.value}deg` }],
    }));

    const animatedStyleInner = useAnimatedStyle(() => ({
        transform: [{ rotate: `${spinRotationReverse.value}deg` }],
    }));

    return (
        <View className="flex-1 bg-background-light dark:bg-background-dark overflow-hidden">
            <Stack.Screen options={{ headerShown: false }} />
            <Header title="Glaido" isLive={true} />

            <View className="flex-1 px-6 justify-between pb-8">

                {/* Listening Badge */}
                <View className="items-center mt-4">
                    <View className="flex-row items-center gap-2 bg-surface-light dark:bg-surface-dark border border-gray-200 dark:border-gray-800 rounded-full px-4 py-1.5 shadow-sm">
                        <View className="relative w-2.5 h-2.5">
                            {/* <View className="absolute inset-0 rounded-full bg-primary opacity-75 animate-ping" /> */}
                            <View className="rounded-full w-2.5 h-2.5 bg-primary" />
                        </View>
                        <Text className="text-xs font-medium text-gray-600 dark:text-gray-300 tracking-wide uppercase">
                            Listening
                        </Text>
                    </View>
                </View>

                {/* Central Visualization */}
                <View className="flex-1 items-center justify-center -mt-10">
                    <View className="relative w-48 h-48 flex items-center justify-center">
                        {/* Glowing background */}
                        <View className="absolute inset-0 bg-primary/20 dark:bg-primary/10 rounded-full opacity-50" style={{ shadowColor: '#D1F249', shadowRadius: 30, shadowOpacity: 0.5 }} />

                        {/* Rotating rings */}
                        <Animated.View className="absolute inset-4 border border-primary/30 rounded-full" style={animatedStyleOuter} />
                        <Animated.View className="absolute inset-8 border border-dashed border-primary/50 rounded-full" style={animatedStyleInner} />

                        <View className="relative w-24 h-24 bg-surface-dark rounded-2xl flex items-center justify-center border border-primary shadow-lg" style={{ shadowColor: '#D1F249', shadowRadius: 20, shadowOpacity: 0.3 }}>
                            <MaterialIcons name="graphic-eq" size={48} color="#D1F249" />
                        </View>
                    </View>

                    <View className="mt-8">
                        <VoiceBars />
                    </View>
                </View>

                {/* Transcript Area */}
                <View className="w-full max-w-md mx-auto space-y-4 mb-24 z-10 gap-4">
                    {/* Raw Input Card */}
                    <View className="bg-surface-light dark:bg-surface-dark/50 backdrop-blur-md rounded-2xl p-4 border border-gray-200 dark:border-gray-800 opacity-60">
                        <View className="flex-row items-center gap-2 mb-2">
                            <Image
                                source={{ uri: 'https://i.pravatar.cc/100' }}
                                className="w-6 h-6 rounded-full border border-gray-600"
                            />
                            <Text className="text-[10px] uppercase tracking-wider text-gray-500 font-semibold">
                                Raw Input
                            </Text>
                        </View>
                        <Text className="text-sm text-gray-500 dark:text-gray-400 italic">
                            "Um, can you like send me that file when you get a chance maybe?"
                        </Text>
                    </View>

                    {/* Corrected Input Card */}
                    <View className="bg-surface-light dark:bg-surface-dark rounded-2xl p-5 border border-primary/40 shadow-lg relative overflow-hidden">
                        <View className="absolute top-0 right-0 w-16 h-16 bg-primary/10 rounded-bl-full -mr-8 -mt-8" />
                        <View className="flex-row justify-between items-start mb-3">
                            <View className="flex-row items-center gap-2">
                                <View className="w-5 h-5 bg-primary rounded-md flex items-center justify-center">
                                    <MaterialIcons name="auto-awesome" size={14} color="#000000" />
                                </View>
                                <Text className="text-[10px] uppercase tracking-wider text-primary font-bold">
                                    Glaido Writes
                                </Text>
                            </View>
                            <TouchableOpacity>
                                <MaterialIcons name="content-copy" size={20} color="#9CA3AF" />
                            </TouchableOpacity>
                        </View>
                        <Text className="text-lg font-medium leading-relaxed text-gray-800 dark:text-gray-100">
                            "Can you send me that file when you get a chance?"
                        </Text>
                    </View>
                </View>
            </View>

            {/* Bottom Controls */}
            <View className="absolute bottom-0 left-0 right-0 p-6 h-32 flex justify-center items-center z-20" style={{ paddingBottom: Math.max(insets.bottom, 24) }}>
                <View className="flex-row items-center gap-8 mb-2">
                    <TouchableOpacity className="p-3 rounded-full bg-surface-light dark:bg-surface-dark border border-gray-200 dark:border-gray-700">
                        <MaterialIcons name="keyboard" size={24} color="#9CA3AF" />
                    </TouchableOpacity>

                    <TouchableOpacity className="relative group">
                        <View className="w-20 h-20 bg-primary rounded-full flex items-center justify-center border-4 border-background-dark shadow-lg">
                            <View className="w-6 h-6 bg-background-dark rounded-sm" />
                        </View>
                    </TouchableOpacity>

                    <TouchableOpacity
                        className="p-3 rounded-full bg-surface-light dark:bg-surface-dark border border-gray-200 dark:border-gray-700"
                        onPress={() => router.push('/home')}
                    >
                        <MaterialIcons name="history" size={24} color="#9CA3AF" />
                    </TouchableOpacity>
                </View>
            </View>

            {/* Background decorations */}
            <View className="absolute top-1/4 -left-20 w-64 h-64 bg-primary/5 rounded-full blur-3xl" />
            <View className="absolute bottom-1/4 -right-20 w-80 h-80 bg-primary/5 rounded-full blur-3xl" />
        </View>
    );
}
