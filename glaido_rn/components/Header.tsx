import { View, Text, TouchableOpacity } from 'react-native';
import { MaterialIcons } from '@expo/vector-icons';
import { useSafeAreaInsets } from 'react-native-safe-area-context';
import { router } from 'expo-router';

export default function Header({ title = 'Glaido', isLive = true }) {
    const insets = useSafeAreaInsets();

    return (
        <View
            style={{ paddingTop: Math.max(insets.top, 48) }}
            className="pb-4 px-6 flex-row justify-between items-center z-10 bg-background-light dark:bg-background-dark/95"
        >
            <View className="flex-row items-center space-x-2 gap-2">
                <View className="w-8 h-8 bg-surface-dark rounded-lg flex items-center justify-center border border-gray-200 dark:border-gray-800">
                    <MaterialIcons name="segment" size={18} color="#D1F249" style={{ transform: [{ rotate: '90deg' }] }} />
                </View>
                <Text className="font-bold text-lg tracking-tight text-gray-900 dark:text-white">
                    {title}
                </Text>
            </View>

            <View className="flex-row items-center space-x-4 gap-4">
                {isLive && (
                    <View className="border border-gray-200 dark:border-gray-800 rounded px-2 py-1">
                        <Text className="text-xs font-mono text-gray-500 dark:text-gray-400">
                            LIVE BETA
                        </Text>
                    </View>
                )}
                <TouchableOpacity
                    className="text-gray-600 dark:text-gray-300"
                    onPress={() => router.push('/settings')}
                >
                    <MaterialIcons name="settings" size={24} color="#9CA3AF" />
                </TouchableOpacity>
            </View>
        </View>
    );
}
