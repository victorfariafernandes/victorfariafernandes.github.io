export const colors = {
	// Brand blue — maps to Flowbite's primary-* utilities
	primary: {
		50: '#E0F9FF',
		100: '#C7F5FF',
		200: '#8FEAFF',
		300: '#52DFFF',
		400: '#1AD5FF',
		500: '#00B7E0',
		600: '#0092B3',
		700: '#006C85',
		800: '#004B5C',
		900: '#00252E',
		950: '#001114'
	},
	// Teal-tinted greyscale — maps to Flowbite's secondary-* utilities
	secondary: {
		50: '#F5F9FA',
		100: '#EBF3F4',
		200: '#D4E4E8',
		300: '#C0D8DD',
		400: '#ACCBD2',
		500: '#96BDC6',
		600: '#6AA2AE',
		700: '#4A7C87',
		800: '#305259',
		900: '#192A2E',
		950: '#0D1517'
	},
	error: {
		50: '#FFE5E5',
		100: '#FFD1D1',
		200: '#FFA3A3',
		300: '#FF7070',
		400: '#FF4242',
		500: '#FF1414',
		600: '#DB0000',
		700: '#A30000',
		800: '#700000',
		900: '#380000',
		950: '#190000'
	},
	gradient: {
		blue: 'linear-gradient(270deg, #00B7E0 0%, #006C85 100%)'
	}
} as const;

export type PrimaryShade = keyof typeof colors.primary;
export type SecondaryShade = keyof typeof colors.secondary;
export type ErrorShade = keyof typeof colors.error;
