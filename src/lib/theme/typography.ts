export const typography = {
	fontFamily: {
		display: "'Space Grotesk', ui-sans-serif, system-ui, sans-serif",
		sans: "'Helvetica', ui-sans-serif, system-ui, sans-serif",
		mono: "'JetBrains Mono', ui-monospace, monospace"
	},
	// size / lineHeight / weight
	scale: {
		displayLg: { size: '52px', lineHeight: '56px', weight: 400 },
		displayLgBold: { size: '56px', lineHeight: '64px', weight: 700 },
		h1: { size: '40px', lineHeight: '48px', weight: 400 },
		h1Bold: { size: '40px', lineHeight: '48px', weight: 700 },
		h2: { size: '36px', lineHeight: '44px', weight: 400 },
		h2Bold: { size: '36px', lineHeight: '44px', weight: 700 },
		h3: { size: '32px', lineHeight: '36px', weight: 400 },
		h3Bold: { size: '32px', lineHeight: '36px', weight: 700 },
		h4: { size: '20px', lineHeight: '28px', weight: 400 },
		h4Bold: { size: '20px', lineHeight: '28px', weight: 700 },
		p1: { size: '18px', lineHeight: '32px', weight: 400 },
		p1Bold: { size: '18px', lineHeight: '32px', weight: 700 },
		p2: { size: '16px', lineHeight: '32px', weight: 400 },
		p2Bold: { size: '16px', lineHeight: '32px', weight: 700 },
		label: { size: '16px', lineHeight: '24px', weight: 400 },
		labelBold: { size: '16px', lineHeight: '24px', weight: 700 }
	}
} as const;
