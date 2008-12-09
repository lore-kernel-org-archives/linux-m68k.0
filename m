From: Andreas Schwab <schwab@suse.de>
Subject: Re: Merge headerfiles for m68k and m68knommu to arch/m68k/include/asm
Date: Tue, 09 Dec 2008 10:45:36 +0100
Message-ID: <jebpvl4r7j.fsf@sykes.suse.de>
References: <20081208205814.GA22697@uranus.ravnborg.org>
	<Pine.LNX.4.64.0812082359190.29640@anakin>
	<200812090026.06689.arnd@arndb.de>
	<20081209054528.GA1407@uranus.ravnborg.org>
	<Pine.LNX.4.64.0812090921310.29640@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0812090921310.29640@anakin> (Geert Uytterhoeven's
	message of "Tue, 9 Dec 2008 09:24:47 +0100 (CET)")
Sender: linux-kbuild-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>, Greg Ungerer <gerg@uclinux.org>, uclinux-dev <uclinux-dev@uclinux.org>, linux-kbuild <linux-kbuild@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Ah, it's the restart_syscall:
>
> --- include/asm-m68k/unistd.h	2008-10-18 10:34:15.000000000 +0200
> +++ arch/m68knommu/include/asm/unistd.h	2008-10-12 14:08:01.000000000=
 +0200
> @@ -5,6 +5,7 @@
>   * This file contains the system call numbers.
>   */
> =20
> +#define __NR_restart_syscall      0
>  #define __NR_exit		  1
>  #define __NR_fork		  2
>  #define __NR_read		  3
> @@ -359,9 +360,6 @@
>  #define __ARCH_WANT_SYS_SIGPROCMASK
>  #define __ARCH_WANT_SYS_RT_SIGACTION
> =20
> -/* whitelist for checksyscalls */
> -#define __IGNORE_restart_syscall
> -
>  /*
>   * "Conditional" syscalls
>   *
>
> Sorry, I don't know about syscall restart handling, and why it differ=
s. Anyone
> who can enlighten me?

The syscall restart handling is not yet implemented on m68k(nommu), so
there is no real difference.

Andreas.

--=20
Andreas Schwab, SuSE Labs, schwab@suse.de
SuSE Linux Products GmbH, Maxfeldstra=DFe 5, 90409 N=FCrnberg, Germany
PGP key fingerprint =3D 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4=
ED5
"And now for something completely different."
--
To unsubscribe from this list: send the line "unsubscribe linux-kbuild"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
