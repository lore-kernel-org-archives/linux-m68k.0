From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Cross Memory Attach v3
Date: Sat, 17 Dec 2011 03:18:03 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1112170255070.856@herc.mirbsd.org>
References: <20110719003537.16b189ae@lilo>
 <CAMuHMdWAhn7M8o0qY4pz3W1tyyKEcNY_YQL_6JuAPCcjL5vS1A@mail.gmail.com>
 <20111121104313.63c7f796@cyeoh-System-Product-Name>
 <CAMuHMdXfWoHx4GA3L8T6-6PFw9fdCVbooayR3La2Woe-0V2koA@mail.gmail.com>
 <Pine.BSM.4.64L.1112041436510.16947@herc.mirbsd.org> <m2iplwuqwr.fsf@igel.home>
 <Pine.BSM.4.64L.1112112209570.6937@herc.mirbsd.org> <20111213105916.GA9956@hall.aurel32.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
In-Reply-To: <20111213105916.GA9956@hall.aurel32.net>
Resent-Message-ID: <uTOBmmbId5L.A.01H.wtA7OB@liszt>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
To: libc-ports@sourceware.org
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>, GNU Libc Maintainers <debian-glibc@lists.debian.org>
List-Id: linux-m68k@vger.kernel.org

I=E2=80=99ve tested the below patch locally in the meantime, and it
does not break anything.

Aurelien Jarno dixit:

>On Sun, Dec 11, 2011 at 10:11:03PM +0000, Thorsten Glaser wrote:
>> Andreas Schwab dixit:
>>=20
>> >Thorsten Glaser <tg@mirbsd.de> writes:
>> >
>> >> Index: eglibc-2.13/ports/sysdeps/unix/sysv/linux/m68k/syscall.S
>> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >> --- eglibc-2.13.orig/ports/sysdeps/unix/sysv/linux/m68k/syscall.S=092=
011-12-04 14:36:16.000000000 +0000
>> >> +++ eglibc-2.13/ports/sysdeps/unix/sysv/linux/m68k/syscall.S=092011-1=
2-04 14:36:26.000000000 +0000
>> >> @@ -24,9 +24,9 @@
>> >>  =09.text
>> >>  ENTRY (syscall)
>> >>  =09move.l 4(%sp), %d0=09/* Load syscall number.  */
>> >> -=09_DOARGS_5 (24)=09=09/* Frob arguments.  */
>> >> +=09_DOARGS_6 (28)=09=09/* Frob arguments.  */
>> >>  =09trap &0=09=09=09/* Do the system call.  */
>> >> -=09UNDOARGS_5=09=09/* Unfrob arguments.  */
>> >> +=09UNDOARGS_6=09=09/* Unfrob arguments.  */
>> >>  =09cmp.l &-4095, %d0=09/* Check %d0 for error.  */
>> >>  =09jcc SYSCALL_ERROR_LABEL=09/* Jump to error handler if negative.  =
*/
>> >>  =09rts=09=09=09/* Return to caller.  */
>> >
>> >Thanks, installed.
>>=20
>> (Where?) So, should $someone submit that to eglibc-ports and
>> Debisn src:eglibc? Did it indeed do the trick?
>
>This patch should be reported to libc-ports@sourceware.org. If it also=20

Reporting hereby.

>needs to be applied to the Debian package quickly, please open a bug=20
>report in the Debian BTS.

@kernel people, is this needed / useful? Do we want/need this?
(I wonder why it's not using _DOARGS_6 already, as that looks
as if it were designed for it.)

bye,
//mirabilos
--=20
22:20=E2=8E=9C<asarch> The crazy that persists in his craziness becomes a m=
aster
22:21=E2=8E=9C<asarch> And the distance between the craziness and geniality=
 is
only measured by the success 18:35=E2=8E=9C<asarch> "Psychotics are consist=
ently
inconsistent. The essence of sanity is to be inconsistently inconsistent
