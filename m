From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 2/2] m68k: Cleanup linker scripts using new linker
	script macros.
Date: Sun, 27 Sep 2009 11:58:06 +0200
Message-ID: <10f740e80909270258o6bde0f3dk720bd5b5c091ed2f@mail.gmail.com>
References: <1253119466-19488-1-git-send-email-tabbott@ksplice.com>
	 <1253119466-19488-3-git-send-email-tabbott@ksplice.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f188.google.com ([209.85.222.188]:51110 "EHLO
	mail-pz0-f188.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753641AbZI0J6C convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 27 Sep 2009 05:58:02 -0400
In-Reply-To: <1253119466-19488-3-git-send-email-tabbott@ksplice.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Tim Abbott <tabbott@ksplice.com>
Cc: Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

On Wed, Sep 16, 2009 at 18:44, Tim Abbott <tabbott@ksplice.com> wrote:
> Signed-off-by: Tim Abbott <tabbott@ksplice.com>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Roman Zippel <zippel@linux-m68k.org>
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: Sam Ravnborg <sam@ravnborg.org>

This patch must do something wrong, as it now fails to boot on ARAnyM:

| CPU: Double bus fault detected !
| CPU: Halting

Haven't investigated why yet, though...

> ---
> =C2=A0arch/m68k/kernel/vmlinux-std.lds =C2=A0| =C2=A0 53 +++++++-----=
------------------------
> =C2=A0arch/m68k/kernel/vmlinux-sun3.lds | =C2=A0 53 +++++++----------=
--------------------
> =C2=A02 files changed, 21 insertions(+), 85 deletions(-)
>
> diff --git a/arch/m68k/kernel/vmlinux-std.lds b/arch/m68k/kernel/vmli=
nux-std.lds
> index 47eac19..5927487 100644
> --- a/arch/m68k/kernel/vmlinux-std.lds
> +++ b/arch/m68k/kernel/vmlinux-std.lds
> @@ -2,6 +2,7 @@
>
> =C2=A0#include <asm-generic/vmlinux.lds.h>
> =C2=A0#include <asm/page.h>
> +#include <asm/thread_info.h>
>
> =C2=A0OUTPUT_FORMAT("elf32-m68k", "elf32-m68k", "elf32-m68k")
> =C2=A0OUTPUT_ARCH(m68k)
> @@ -22,73 +23,41 @@ SECTIONS
>
> =C2=A0 _etext =3D .; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0/* End of text section */
>
> - =C2=A0. =3D ALIGN(16); =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* Exception table */
> - =C2=A0__start___ex_table =3D .;
> - =C2=A0__ex_table : { *(__ex_table) }
> - =C2=A0__stop___ex_table =3D .;
> + =C2=A0EXCEPTION_TABLE(16)
>
> =C2=A0 RODATA
>
> - =C2=A0.data : { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* Data */
> - =C2=A0 =C2=A0 =C2=A0 DATA_DATA
> - =C2=A0 =C2=A0 =C2=A0 CONSTRUCTORS
> - =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0RW_DATA_SECTION(16, PAGE_SIZE, THREAD_SIZE)
>
> - =C2=A0. =3D ALIGN(16);
> - =C2=A0.data.cacheline_aligned : { *(.data.cacheline_aligned) }
> -
> - =C2=A0.bss : { *(.bss) } =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* BSS =
*/
> + =C2=A0BSS_SECTION(0, 0, 0)
>
> =C2=A0 _edata =3D .; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0/* End of data section */
>
> =C2=A0 /* will be freed after init */
> =C2=A0 . =3D ALIGN(PAGE_SIZE); =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* Init code and data */
> =C2=A0 __init_begin =3D .;
> - =C2=A0.init.text : {
> - =C2=A0 =C2=A0 =C2=A0 _sinittext =3D .;
> - =C2=A0 =C2=A0 =C2=A0 INIT_TEXT
> - =C2=A0 =C2=A0 =C2=A0 _einittext =3D .;
> - =C2=A0} :data
> + =C2=A0INIT_TEXT_SECTION(PAGE_SIZE) :data
> + =C2=A0INIT_DATA_SECTION(16)
> =C2=A0 .init.data : { INIT_DATA }
> - =C2=A0. =3D ALIGN(16);
> - =C2=A0__setup_start =3D .;
> - =C2=A0.init.setup : { *(.init.setup) }
> - =C2=A0__setup_end =3D .;
> - =C2=A0__initcall_start =3D .;
> + =C2=A0.init.setup : { INIT_SETUP(16) }
> =C2=A0 .initcall.init : {
> - =C2=A0 =C2=A0 =C2=A0 INITCALLS
> + =C2=A0 =C2=A0 =C2=A0 INIT_CALLS
> =C2=A0 }
> - =C2=A0__initcall_end =3D .;
> - =C2=A0__con_initcall_start =3D .;
> - =C2=A0.con_initcall.init : { *(.con_initcall.init) }
> - =C2=A0__con_initcall_end =3D .;
> + =C2=A0.con_initcall.init : { CON_INITCALL }
> =C2=A0 .m68k_fixup : {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0__start_fixup =3D .;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0*(.m68k_fixup)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0__stop_fixup =3D .;
> =C2=A0 }
> =C2=A0 SECURITY_INIT
> -#ifdef CONFIG_BLK_DEV_INITRD
> - =C2=A0. =3D ALIGN(8192);
> - =C2=A0__initramfs_start =3D .;
> - =C2=A0.init.ramfs : { *(.init.ramfs) }
> - =C2=A0__initramfs_end =3D .;
> -#endif
> + =C2=A0.init.ramfs : { INIT_RAM_FS }
> =C2=A0 NOTES
> =C2=A0 . =3D ALIGN(8192);
> =C2=A0 __init_end =3D .;
>
> - =C2=A0.data.init_task : { *(.data.init_task) } =C2=A0 =C2=A0 /* The=
 initial task and kernel stack */
> -
> =C2=A0 _end =3D . ;
>
> - =C2=A0/* Stabs debugging sections. =C2=A0*/
> - =C2=A0.stab 0 : { *(.stab) }
> - =C2=A0.stabstr 0 : { *(.stabstr) }
> - =C2=A0.stab.excl 0 : { *(.stab.excl) }
> - =C2=A0.stab.exclstr 0 : { *(.stab.exclstr) }
> - =C2=A0.stab.index 0 : { *(.stab.index) }
> - =C2=A0.stab.indexstr 0 : { *(.stab.indexstr) }
> + =C2=A0STABS_DEBUG
> =C2=A0 .comment 0 : { *(.comment) }
>
> =C2=A0 /* Sections to be discarded */
> diff --git a/arch/m68k/kernel/vmlinux-sun3.lds b/arch/m68k/kernel/vml=
inux-sun3.lds
> index 03efaf0..607d214 100644
> --- a/arch/m68k/kernel/vmlinux-sun3.lds
> +++ b/arch/m68k/kernel/vmlinux-sun3.lds
> @@ -2,6 +2,7 @@
>
> =C2=A0#include <asm-generic/vmlinux.lds.h>
> =C2=A0#include <asm/page.h>
> +#include <asm/thread_info.h>
>
> =C2=A0OUTPUT_FORMAT("elf32-m68k", "elf32-m68k", "elf32-m68k")
> =C2=A0OUTPUT_ARCH(m68k)
> @@ -23,14 +24,8 @@ SECTIONS
>
> =C2=A0 _etext =3D .; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0/* End of text section */
>
> - =C2=A0.data : { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* Data */
> - =C2=A0 =C2=A0 =C2=A0 DATA_DATA
> - =C2=A0 =C2=A0 =C2=A0 CONSTRUCTORS
> - =C2=A0 =C2=A0 =C2=A0 . =3D ALIGN(16); =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* Exception table */
> - =C2=A0 =C2=A0 =C2=A0 __start___ex_table =3D .;
> - =C2=A0 =C2=A0 =C2=A0 *(__ex_table)
> - =C2=A0 =C2=A0 =C2=A0 __stop___ex_table =3D .;
> - =C2=A0 =C2=A0 =C2=A0 } :data
> + =C2=A0EXCEPTION_TABLE(16)
> + =C2=A0RW_DATA_SECTION(16, PAGE_SIZE, THREAD_SIZE) :data
> =C2=A0 /* End of data goes *here* so that freeing init code works pro=
perly. */
> =C2=A0 _edata =3D .;
> =C2=A0 NOTES
> @@ -38,56 +33,28 @@ SECTIONS
> =C2=A0 /* will be freed after init */
> =C2=A0 . =3D ALIGN(PAGE_SIZE); =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Init cod=
e and data */
> =C2=A0__init_begin =3D .;
> - =C2=A0 =C2=A0 =C2=A0 .init.text : {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _sinittext =3D .;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INIT_TEXT
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _einittext =3D .;
> - =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 INIT_TEXT_SECTION(PAGE_SIZE)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.init.data : { INIT_DATA }
> - =C2=A0 =C2=A0 =C2=A0 . =3D ALIGN(16);
> - =C2=A0 =C2=A0 =C2=A0 __setup_start =3D .;
> - =C2=A0 =C2=A0 =C2=A0 .init.setup : { *(.init.setup) }
> - =C2=A0 =C2=A0 =C2=A0 __setup_end =3D .;
> - =C2=A0 =C2=A0 =C2=A0 __initcall_start =3D .;
> + =C2=A0 =C2=A0 =C2=A0 .init.setup : { INIT_SETUP(16) }
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.initcall.init : {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INITCALLS
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INIT_CALLS
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> - =C2=A0 =C2=A0 =C2=A0 __initcall_end =3D .;
> - =C2=A0 =C2=A0 =C2=A0 __con_initcall_start =3D .;
> - =C2=A0 =C2=A0 =C2=A0 .con_initcall.init : { *(.con_initcall.init) }
> - =C2=A0 =C2=A0 =C2=A0 __con_initcall_end =3D .;
> + =C2=A0 =C2=A0 =C2=A0 .con_initcall.init : { CON_INITCALL }
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.m68k_fixup : {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__start_fixup =
=3D .;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*(.m68k_fixup)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__stop_fixup =3D=
 .;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0SECURITY_INIT
> -#ifdef CONFIG_BLK_DEV_INITRD
> - =C2=A0 =C2=A0 =C2=A0 . =3D ALIGN(PAGE_SIZE);
> - =C2=A0 =C2=A0 =C2=A0 __initramfs_start =3D .;
> - =C2=A0 =C2=A0 =C2=A0 .init.ramfs : { *(.init.ramfs) }
> - =C2=A0 =C2=A0 =C2=A0 __initramfs_end =3D .;
> -#endif
> + =C2=A0 =C2=A0 =C2=A0 .init.ramfs : { INIT_RAM_FS }
> =C2=A0 =C2=A0 =C2=A0 =C2=A0. =3D ALIGN(PAGE_SIZE);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0__init_end =3D .;
> - =C2=A0 =C2=A0 =C2=A0 .data.init.task : { *(.data.init_task) }
> -
>
> - =C2=A0.bss : { *(.bss) } =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* BSS =
*/
> + =C2=A0BSS_SECTION(0, 0, 0)
>
> =C2=A0 _end =3D . ;
>
> - =C2=A0.crap : {
> - =C2=A0 =C2=A0 =C2=A0 /* Stabs debugging sections. =C2=A0*/
> - =C2=A0 =C2=A0 =C2=A0 *(.stab)
> - =C2=A0 =C2=A0 =C2=A0 *(.stabstr)
> - =C2=A0 =C2=A0 =C2=A0 *(.stab.excl)
> - =C2=A0 =C2=A0 =C2=A0 *(.stab.exclstr)
> - =C2=A0 =C2=A0 =C2=A0 *(.stab.index)
> - =C2=A0 =C2=A0 =C2=A0 *(.stab.indexstr)
> - =C2=A0 =C2=A0 =C2=A0 *(.comment)
> - =C2=A0 =C2=A0 =C2=A0 *(.note)
> - =C2=A0}
> + =C2=A0STABS_DEBUG
>
> =C2=A0 /* Sections to be discarded */
> =C2=A0 DISCARDS
> --
> 1.6.3.3
>
>



--=20
Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
