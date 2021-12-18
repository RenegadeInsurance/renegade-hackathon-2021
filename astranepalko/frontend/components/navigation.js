import { useState } from 'react';
import {
  Flex,
  Button,
  Switch,
  IconButton,
  useColorMode,
} from '@chakra-ui/react';
import { HamburgerIcon, CloseIcon } from '@chakra-ui/icons';
import NextLink from 'next/link';
import { navLinks } from '../routes';

export default function NavBar() {
  const { colorMode, toggleColorMode } = useColorMode();
  const isDark = colorMode === 'dark';
  const [display, changeDisplay] = useState('none');

  return (
    <>
    <Flex>
      {/* Mobile */}
      <IconButton
        aria-label="Open Menu"
        size="lg"
        mr={2}
        icon={<HamburgerIcon />}
        onClick={() => changeDisplay('flex')}
        display={['flex', 'flex', 'none', 'none']}
      />
      <Flex position="fixed" top="1rem" right="1rem" align="center">
        {/* Desktop */}
        <Flex display={['none', 'none', 'flex', 'flex']}>
          {navLinks.map(link => {
            return (
              <>
                <NextLink href={link.path} passHref>
                  <Button
                    as="a"
                    variant="ghost"
                    aria-label={link.name}
                    my={5}
                    w="100%"
                  >
                    {link.name}
                  </Button>
                </NextLink>
              </>
            );
          })}
        </Flex>
        <Switch color="green" isChecked={isDark} onChange={toggleColorMode} />
      </Flex>

      {/* Mobile Content */}
      <Flex
        w="100vw"
        display={display}
        zIndex={20}
        h="100vh"
        pos="fixed"
        top="0"
        left="0"
        zIndex={20}
        overflowY="auto"
        flexDir="column"
      >
        <Flex justify="flex-end">
          <IconButton
            mt={2}
            mr={2}
            aria-label="Open Menu"
            size="lg"
            icon={<CloseIcon />}
            onClick={() => changeDisplay('none')}
          />
        </Flex>

        <Flex flexDir="column" align="center">
          {navLinks.map(link => {
            return (
              <>
                <NextLink href={link.path} passHref>
                  <Button
                    as="a"
                    variant="ghost"
                    aria-label={link.name}
                    my={5}
                    w="100%"
                  >
                    {link.name}
                  </Button>
                </NextLink>
              </>
            );
          })}
        </Flex>
      </Flex>
    </Flex>
    </>
  );
}
