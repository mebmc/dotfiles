#!/bin/bash

defaults write org.alacritty CGFontRenderingFontSmoothingDisabled -bool YES
defaults write org.alacritty AppleFontSmoothing -int 0

defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO
defaults write -g AppleFontSmoothing -int 2

echo "Alacritty:"
echo "CGFontRenderingFontSmoothingDisabled: $(defaults read org.alacritty CGFontRenderingFontSmoothingDisabled)"
echo "AppleFontSmoothing: $(defaults read org.alacritty AppleFontSmoothing)"
echo
echo "Global:"
echo "CGFontRenderingFontSmoothingDisabled: $(defaults read -globalDomain CGFontRenderingFontSmoothingDisabled)"
echo "AppleFontSmoothing: $(defaults read -globalDomain AppleFontSmoothing)"

