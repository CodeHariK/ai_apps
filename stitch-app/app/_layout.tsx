import "../global.css";
import { Stack } from "expo-router";
import { useColorScheme } from "nativewind";
import { useEffect } from "react";
import { SafeAreaProvider } from "react-native-safe-area-context";

export default function RootLayout() {
    const { setColorScheme } = useColorScheme();

    useEffect(() => {
        // Force dark mode as specified by the HTML comment
        setColorScheme("dark");
    }, []);

    return (
        <SafeAreaProvider>
            <Stack screenOptions={{ headerShown: false }}>
                <Stack.Screen name="index" />
                <Stack.Screen name="home" />
            </Stack>
        </SafeAreaProvider>
    );
}
