import React, { useEffect } from 'react';
import { View } from 'react-native';
import Animated, {
    useSharedValue,
    useAnimatedStyle,
    withRepeat,
    withTiming,
    withSequence,
    Easing
} from 'react-native-reanimated';

const Bar = ({ minHeight, maxHeight, duration, delay }: { minHeight: number, maxHeight: number, duration: number, delay: number }) => {
    const height = useSharedValue(minHeight);

    useEffect(() => {
        setTimeout(() => {
            height.value = withRepeat(
                withSequence(
                    withTiming(maxHeight, { duration: duration / 2, easing: Easing.inOut(Easing.ease) }),
                    withTiming(minHeight, { duration: duration / 2, easing: Easing.inOut(Easing.ease) })
                ),
                -1, // Infinite
                true // Reverse
            );
        }, delay);
    }, []);

    const animatedStyle = useAnimatedStyle(() => {
        return {
            height: `${height.value}%`,
        };
    });

    return (
        <Animated.View
            className="w-1 bg-primary rounded-full mx-0.5"
            style={animatedStyle}
        />
    );
};

export default function VoiceBars() {
    return (
        <View className="h-12 flex-row items-center justify-center w-full max-w-[200px]">
            <Bar minHeight={10} maxHeight={30} duration={800} delay={0} />
            <Bar minHeight={10} maxHeight={50} duration={1100} delay={100} />
            <Bar minHeight={10} maxHeight={80} duration={1300} delay={200} />
            <Bar minHeight={10} maxHeight={60} duration={900} delay={50} />
            <Bar minHeight={10} maxHeight={40} duration={1200} delay={150} />
            <Bar minHeight={10} maxHeight={80} duration={1000} delay={250} />
            <Bar minHeight={10} maxHeight={30} duration={800} delay={0} />
            <Bar minHeight={10} maxHeight={70} duration={1400} delay={300} />
        </View>
    );
}
