import React from 'react';
import { View, Text, TouchableOpacity, ScrollView, Image } from 'react-native';
import { Stack, router } from 'expo-router';
import { MaterialIcons } from '@expo/vector-icons';
import { useSafeAreaInsets } from 'react-native-safe-area-context';
import Header from '../components/Header';

export default function HomeScreen() {
    const insets = useSafeAreaInsets();

    return (
        <View className="flex-1 bg-background-light dark:bg-background-dark">
            <Stack.Screen options={{ headerShown: false }} />
            <Header title="Glaido" isLive={false} />

            <ScrollView className="flex-1" contentContainerStyle={{ paddingBottom: insets.bottom + 40 }}>
                {/* Hero Section */}
                <View className="px-5 mt-6 mb-16 relative">
                    <View className="self-start flex-row items-center gap-2 px-3 py-1 rounded-full border border-primary/30 bg-primary/10 mb-6">
                        <View className="w-2 h-2 rounded-full bg-primary" />
                        <Text className="text-xs font-mono font-medium text-primary tracking-wider uppercase">
                            Now Live in Beta
                        </Text>
                    </View>

                    <Text className="text-4xl sm:text-5xl font-display font-extrabold tracking-tight leading-tight mb-6 text-text-light dark:text-text-dark">
                        Stop typing {'\n'}
                        <Text className="text-gray-500 dark:text-gray-400">start talking</Text>
                    </Text>

                    <Text className="text-text-muted-light dark:text-text-muted-dark text-lg leading-relaxed mb-8 max-w-sm">
                        Speak naturally. Your words appear instantly. Save 20+ hours every month by speaking instead of typing.
                    </Text>

                    <TouchableOpacity
                        className="bg-primary py-3 px-6 rounded-lg shadow-neon flex-row items-center justify-center gap-2 self-start w-full sm:w-auto"
                        onPress={() => router.push('/')}
                    >
                        <Text className="text-background-dark font-semibold text-base">Try Glaido Free</Text>
                        <MaterialIcons name="arrow-outward" size={16} color="#0A0A0A" />
                    </TouchableOpacity>
                </View>

                {/* Stat Box */}
                <View className="px-5 mb-20">
                    <View className="rounded-2xl bg-surface-dark border border-border-dark p-6 overflow-hidden shadow-2xl relative">
                        {/* Glow effect */}
                        <View className="absolute -top-20 -right-20 w-64 h-64 bg-primary/20 rounded-full" style={{ opacity: 0.3 }} />

                        <View className="flex-row justify-between items-center mb-8 border-b border-border-dark pb-4">
                            <View className="flex-row gap-2">
                                <View className="w-2 h-2 rounded-full bg-red-500" />
                                <View className="w-2 h-2 rounded-full bg-yellow-500" />
                                <View className="w-2 h-2 rounded-full bg-green-500" />
                            </View>
                            <Text className="text-xs text-text-muted-dark uppercase font-mono">Typing Speed</Text>
                        </View>

                        <View className="items-center justify-center py-8">
                            <Text className="text-6xl font-display font-black text-primary mb-2 shadow-glow">5x</Text>
                            <Text className="text-2xl font-light text-text-dark tracking-wide">faster</Text>
                            <Text className="text-sm text-text-muted-dark mt-4 text-center max-w-[200px]">
                                Save ~20 hours/month by speaking instead.
                            </Text>
                        </View>
                    </View>
                </View>

                {/* Interactive Demo Section - simplified for React Native */}
                <View className="px-5 py-12">
                    <Text className="text-xs font-mono uppercase text-text-muted-light dark:text-text-muted-dark tracking-widest mb-4">
                        How it works
                    </Text>
                    <Text className="text-3xl font-display font-bold mb-4 leading-tight text-text-light dark:text-text-dark">
                        Finish your work in {'\n'}
                        <Text className="text-text-muted-light dark:text-text-muted-dark">1/5th the time</Text>
                    </Text>

                    <View className="space-y-6 mt-10">
                        {/* User Bubble */}
                        <View className="bg-surface-dark/5 dark:bg-surface-dark border border-gray-200 dark:border-border-dark p-5 rounded-2xl rounded-bl-sm max-w-[90%] mb-4">
                            <View className="flex-row justify-between items-start mb-2">
                                <View className="flex-row items-center gap-2">
                                    <View className="w-8 h-8 rounded-full bg-gray-300 dark:bg-gray-700" />
                                    <View>
                                        <Text className="text-xs font-bold text-text-light dark:text-text-dark">You</Text>
                                        <Text className="text-[10px] text-text-muted-light dark:text-text-muted-dark">Designer</Text>
                                    </View>
                                </View>
                            </View>
                            <Text className="text-text-light dark:text-gray-300 italic text-sm mt-2">
                                "Um, can you like send me that file when you get a chance maybe?"
                            </Text>
                        </View>

                        {/* Bolt Icon */}
                        <View className="items-center my-2">
                            <View className="w-12 h-12 bg-primary rounded-xl flex items-center justify-center shadow-glow">
                                <MaterialIcons name="bolt" size={24} color="#0A0A0A" />
                            </View>
                        </View>

                        {/* Glaido Bubble */}
                        <View className="bg-surface-dark border border-primary/30 p-5 rounded-2xl rounded-tr-sm max-w-[90%] self-end mt-4">
                            <Text className="text-text-light dark:text-white font-medium text-lg leading-snug">
                                "Can you send me that file when you get a chance?"
                            </Text>
                        </View>
                    </View>
                </View>

                {/* Features List */}
                <View className="px-5 py-12 mt-4 space-y-12">
                    <View className="flex-row gap-4 mb-8">
                        <MaterialIcons name="power-settings-new" size={24} color="#CFFF47" />
                        <View className="flex-1">
                            <Text className="text-lg font-bold mb-1 text-text-light dark:text-text-dark">Works everywhere you work</Text>
                            <Text className="text-sm text-text-muted-light dark:text-text-muted-dark">Gmail, Slack, Cursor, ChatGPT. One hotkey, any app. Consistent results everywhere.</Text>
                        </View>
                    </View>

                    <View className="flex-row gap-4 mb-8">
                        <MaterialIcons name="verified-user" size={24} color="#CFFF47" />
                        <View className="flex-1">
                            <Text className="text-lg font-bold mb-1 text-text-light dark:text-text-dark">Private by design</Text>
                            <Text className="text-sm text-text-muted-light dark:text-text-muted-dark">Local storage. Private servers. Your data never touches third-party AI without your permission.</Text>
                        </View>
                    </View>
                </View>

                {/* Call to Action */}
                <View className="px-5 pb-12 mt-8">
                    <View className="bg-primary rounded-2xl p-8 items-center text-center">
                        <Text className="text-xs font-mono uppercase tracking-widest font-bold mb-4 text-background-dark">Join Us</Text>
                        <Text className="text-3xl font-display font-bold mb-6 text-background-dark text-center">Get started today</Text>
                        <TouchableOpacity
                            className="bg-background-dark px-6 py-4 rounded-lg flex-row items-center gap-2"
                            onPress={() => router.push('/')}
                        >
                            <Text className="text-white font-medium">Try Glaido Free</Text>
                            <MaterialIcons name="arrow-outward" size={16} color="white" />
                        </TouchableOpacity>
                    </View>
                </View>

            </ScrollView>
        </View>
    );
}
