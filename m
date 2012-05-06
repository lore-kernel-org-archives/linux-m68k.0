From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: ARAnyM 0.9.13 with MPFR even for Lucid
Date: Sun, 6 May 2012 23:38:21 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1205062336340.15462@herc.mirbsd.org>
References: <1332282242.3352.7.camel@aspire> <Pine.BSM.4.64L.1203210905300.23907@herc.mirbsd.org>
 <1332322473.10247.56.camel@petr> <CAMuHMdWNktLMKTCkBitY0VQjtaXRaaWR-L4bmKYdvyeadwOkJg@mail.gmail.com>
 <1332337279.5083.3.camel@aspire> <CAMuHMdXLUEYpiGrHrtDw=MjSZn3yZ1Of8TLf4wPmiDr9grpreg@mail.gmail.com>
 <1332505616.22403.27.camel@petr> <CAMuHMdXCiX=11xZcKn8b9JB1vvGpkozp_hAbZ4jKqpEpwsbroQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
In-Reply-To: <CAMuHMdXCiX=11xZcKn8b9JB1vvGpkozp_hAbZ4jKqpEpwsbroQ@mail.gmail.com>
Resent-Message-ID: <8CrVF3SCqCP.A.NEC.UuwpPB@bendel>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Petr Stehlik <pstehlik@sophics.cz>, debian-68k@lists.debian.org, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Geert Uytterhoeven dixit:

>On Fri, Mar 23, 2012 at 13:26, Petr Stehlik <pstehlik@sophics.cz> wrote:
>> I couldn't stand the feeling that Geert cannot enjoy new Andreas' MPFR
>> FPU emulation in ARAnyM so I have backported the libmpfr4 for Lucid:
>>
>> http://sourceforge.net/projects/aranym/files/aranym/0.9.13/lucid_mpfr4/

>Thanks! You're too kind ;-)

http://article.gmane.org/gmane.linux.debian.ports.68k/10307

Since this lucid thing-y seems to get some use=E2=80=A6 here you are:
a forwardport of a backport of the official Debian sid mpfr4
and aranym packages ;-)

https://launchpad.net/~mirabilos/+archive/wtf-forwardports/+sourcepub/24380=
38/+listing-archive-extra

(just the stuff I backported to hardy, rebuilt for lucid)

https://launchpad.net/~mirabilos/+archive/wtf-forwardports/+sourcepub/24380=
41/+listing-archive-extra

(re-enabled USB support, as libusb-1.0 is in lucid but not hardy)

Enjoy!
//mirabilos
--=20
22:59=E2=8E=9C<Vutral> glaub ich termkit is kompliziert | glabe nicht das m=
an
damit schneller arbeitet | reiz=C3=BCberflutung =E2=94=82 wie windows =E2=
=94=82 alles evil
zuviel bilder =E2=94=82 wie ein spiel | 23:00=E2=8E=9C<Vutral> die meisten =
raffen auch
nicht mehr von windows | 23:01=E2=8E=9C<Vutral> bilderb=C3=BCcher sind ja a=
uch nich
wirklich verbreitet als erwachsenen literatur=09=E2=80=A3 who needs GUIs th=
us?
