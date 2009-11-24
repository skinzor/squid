dnl 
dnl AUTHOR: Francesco Chemolli
dnl
dnl SQUID Web Proxy Cache          http://www.squid-cache.org/
dnl ----------------------------------------------------------
dnl Squid is the result of efforts by numerous individuals from
dnl the Internet community; see the CONTRIBUTORS file for full
dnl details.   Many organizations have provided support for Squid's
dnl development; see the SPONSORS file for full details.  Squid is
dnl Copyrighted (C) 2001 by the Regents of the University of
dnl California; see the COPYRIGHT file for full details.  Squid
dnl incorporates software developed and/or copyrighted by other
dnl sources; see the CREDITS file for full details.
dnl
dnl This program is free software; you can redistribute it and/or modify
dnl it under the terms of the GNU General Public License as published by
dnl the Free Software Foundation; either version 2 of the License, or
dnl (at your option) any later version.
dnl
dnl This program is distributed in the hope that it will be useful,
dnl but WITHOUT ANY WARRANTY; without even the implied warranty of
dnl MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
dnl GNU General Public License for more details.
dnl
dnl You should have received a copy of the GNU General Public License
dnl along with this program; if not, write to the Free Software
dnl Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111, USA.


# check if the compiler accepts a supplied flag
# first argument is the variable containing the result (will be set to "yes" or "no"
# second argument is the flag to be tested, verbatim

AC_DEFUN([SQUID_TEST_COMPILER_FLAG],[
  AC_CACHE_CHECK([whether compiler accepts $2],[$1],
  [{
    AC_REQUIRE([AC_PROG_CC])
    SAVED_FLAGS="$CFLAGS"
    SAVED_CXXFLAGS="$CXXFLAGS"
    CFLAGS="$CXXFLAGS $2"
    CXXFLAGS="$CXXFLAGS $2"
    AC_TRY_LINK([],[int foo; ],
      [$1=yes],[$1=no])
    CFLAGS="$SAVED_CFLAGS"
    CXXFLAGS="$SAVED_CXXFLAGS"
  }])
])

# check if the c++ compiler supports the -fhuge-objects flag
# sets the vartiable squid_cv_test_checkforhugeobjects to either "yes" or "no"
AC_DEFUN([SQUID_CXX_CHECK_FHUGEOBJECTS],[
  AC_LANG_PUSH([C++])
  if test "$GCC" = "yes"; then
    SQUID_TEST_COMPILER_FLAG([squid_cv_test_checkforhugeobjects],[-Werror -fhuge-objects])
  else
    squid_cv_test_checkforhugeobjects=no
  fi
  AC_LANG_POP([C++])
])
