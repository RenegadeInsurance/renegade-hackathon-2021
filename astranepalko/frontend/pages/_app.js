import Sidebar from '../comp/sidebar';
import { extendTheme } from '@chakra-ui/react'
import { ChakraProvider } from '@chakra-ui/react'

const colors = {
  brand: {
    900: '#0b1523',
    800: '#153e75',
    700: '#2a69ac',
  },
}

const theme = extendTheme({ colors })
import '../styles/globals.css';
import NavBar from '../components/navigation';

function MyApp({ Component, pageProps }) {
  return (
    <ChakraProvider theme={theme}>
      <NavBar/>
      <Component {...pageProps} />
    </ChakraProvider>
  )
}

export default MyApp