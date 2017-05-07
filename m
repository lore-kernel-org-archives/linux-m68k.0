From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Linux 4.11 FTBFS on m68k
Date: Sun, 7 May 2017 15:16:41 +0200
Message-ID: <b9276262-0f50-02c3-1751-344651d7e377@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
Resent-Message-ID: <zutj3ycNkBG.A.n9B.K5xDZB@bendel>
List-URL: <https://lists.debian.org/debian-68k/>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/b9276262-0f50-02c3-1751-344651d7e377@physik.fu-berlin.de
To: Linux/m68k <linux-m68k@vger.kernel.org>
Cc: Debian m68k <debian-68k@lists.debian.org>
List-Id: linux-m68k@vger.kernel.org

Hi!

Just noticed that currently the 4.11 kernel fails to build from source
on m68k [1]:

  CC      arch/m68k/lib/ashldi3.o
/<<PKGBUILDDIR>>/arch/m68k/lib/ashldi3.c:18:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__mode'
 typedef   int SItype __mode(SI);
                      ^~~~~~
/<<PKGBUILDDIR>>/arch/m68k/lib/ashldi3.c:19:30: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__mode'
 typedef unsigned int USItype __mode(SI);
                              ^~~~~~
/<<PKGBUILDDIR>>/arch/m68k/lib/ashldi3.c:20:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__mode'
 typedef   int DItype __mode(DI);
                      ^~~~~~
/<<PKGBUILDDIR>>/arch/m68k/lib/ashldi3.c:21:33: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__mode'
 typedef int word_type           __mode(__word__);
                                 ^~~~~~
/<<PKGBUILDDIR>>/arch/m68k/lib/ashldi3.c:23:18: error: unknown type name 'SItype'
 struct DIstruct {SItype high, low;};
                  ^~~~~~
/<<PKGBUILDDIR>>/arch/m68k/lib/ashldi3.c:28:3: error: unknown type name 'DItype'
   DItype ll;
   ^~~~~~
/<<PKGBUILDDIR>>/arch/m68k/lib/ashldi3.c:31:1: error: unknown type name 'DItype'
 DItype
 ^~~~~~
/<<PKGBUILDDIR>>/arch/m68k/lib/ashldi3.c:32:12: error: unknown type name 'DItype'
 __ashldi3 (DItype u, word_type b)
            ^~~~~~
/<<PKGBUILDDIR>>/arch/m68k/lib/ashldi3.c:32:22: error: unknown type name 'word_type'
 __ashldi3 (DItype u, word_type b)
                      ^~~~~~~~~
/<<PKGBUILDDIR>>/scripts/Makefile.build:299: recipe for target 'arch/m68k/lib/ashldi3.o' failed
make[6]: *** [arch/m68k/lib/ashldi3.o] Error 1
/<<PKGBUILDDIR>>/Makefile:1006: recipe for target 'arch/m68k/lib' failed
make[5]: *** [arch/m68k/lib] Error 2
make[5]: *** Waiting for unfinished jobs....

Might be something that is only triggered when building with newer gcc versions?
Looks like we need to add __attribute__ here, don't we?

Adrian

> [1] https://buildd.debian.org/status/fetch.php?pkg=linux&arch=m68k&ver=4.11-1%7Eexp2&stamp=1493971608&raw=0
