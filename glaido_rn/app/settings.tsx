import React from 'react';
import { View, Text, TouchableOpacity } from 'react-native';
import { Stack, router } from 'expo-router';
import { MaterialIcons } from '@expo/vector-icons';
import { useSafeAreaInsets } from 'react-native-safe-area-context';
import { useColorScheme } from 'nativewind';

export default function SettingsScreen() {
    const insets = useSafeAreaInsets();
    const { colorScheme, setColorScheme } = useColorScheme();

    const isDarkMode = colorScheme === 'dark';

    const toggleTheme = () => {
        setColorScheme(isDarkMode ? 'light' : 'dark');
    };

    return (
        <View className="flex-1 bg-background-light dark:bg-background-dark">
            <Stack.Screen options={{ headerShown: false }} />
            <View
                style={{ paddingTop: Math.max(insets.top, 48) }}
                className="pb-4 px-6 flex-row items-center justify-between border-b border-gray-200 dark:border-gray-800 bg-background-light dark:bg-background-dark/95"
            >
                <TouchableOpacity
                    onPress={() => router.back()}
                    className="w-10 h-10 items-center justify-center rounded-full hover:bg-gray-100 dark:hover:bg-gray-800"
                >
                    <MaterialIcons name="arrow-back" size={24} color={isDarkMode ? 'white' : 'black'} />
                </TouchableOpacity>
                <Text className="font-bold text-lg text-gray-900 dark:text-white">Settings</Text>
                <View className="w-10 h-10" />
            </View>
            <View className="p-6">
                <Text className="text-xs font-mono uppercase text-gray-500 mb-4 tracking-widest">
                    Preferences
                </Text>
                <View className="flex-row items-center justify-between bg-surface-light dark:bg-surface-dark p-5 rounded-2xl border border-gray-200 dark:border-gray-800 shadow-sm">
                    <View className="flex-row items-center gap-4">
                        <View className="w-10 h-10 rounded-full bg-gray-100 dark:bg-gray-800 flex items-center justify-center">
                            <MaterialIcons
                                name={isDarkMode ? 'dark-mode' : 'light-mode'}
                                size={20}
                                color={isDarkMode ? '#D1F249' : '#0A0A0A'}
                            />
                        </View>
                        <View>
                            <Text className="text-base font-semibold text-gray-900 dark:text-white">
                                Dark Mode
                            </Text>
                            <Text className="text-sm text-gray-500">
                                Toggle application theme
                            </Text>
                        </View>
                    </View>
                    <TouchableOpacity
                        onPress={toggleTheme}
                        className={`w-6 h-6 rounded border items-center justify-center ${isDarkMode
                            ? 'bg-primary border-primary'
                            : 'bg-transparent border-gray-300'
                            }`}
                        activeOpacity={0.7}
                    >
                        {isDarkMode && (
                            <MaterialIcons name="check" size={16} color="#0A0A0A" />
                        )}
                    </TouchableOpacity>
                </View>
            </View>
        </View>
    );
}
