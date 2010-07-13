From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: BUG() in 2.6.33-rc8
Date: Tue, 13 Jul 2010 23:03:27 +0200
Message-ID: <AANLkTim_KDccF5XAUFYhXemebypXPFfAT4-Iuff73CHE@mail.gmail.com>
References: <m21vgkydpu.fsf@igel.home>
	<m2k4tn8uja.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:41909 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752600Ab0GMVD2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 13 Jul 2010 17:03:28 -0400
Received: by wyb42 with SMTP id 42so503103wyb.19
        for <linux-m68k@vger.kernel.org>; Tue, 13 Jul 2010 14:03:27 -0700 (PDT)
In-Reply-To: <m2k4tn8uja.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>

On Mon, Mar 8, 2010 at 03:35, Andreas Schwab <schwab@linux-m68k.org> wr=
ote:
> Andreas Schwab <schwab@linux-m68k.org> writes:
>
>> I'm getting this BUG() when running 2.6.33-rc8 in Aranym:
>>
>> ida_remove called for id=3D13 which is not allocated.
>> BUG: Dentry 10433d14{i=3Df000004e,n=3Dkmsg} still in use (1) [unmoun=
t of proc proc]
>> kernel BUG at fs/dcache.c:670!
>> *** TRAP #7 *** =C2=A0 FORMAT=3D0
>> Current process id is 1014
>> BAD KERNEL TRAP: 00000000
>> Modules linked in: nfs lockd nfs_acl sunrpc ipv6 dm_snapshot dm_mirr=
or dm_region_hash dm_log dm_mod
>> PC: [<0007d56a>] shrink_dcache_for_umount_subtree+0x1ee/0x1f2
>> SR: 2310 =C2=A0SP: 10977ec4 =C2=A0a2: 10951030
>> d0: 00000022 =C2=A0 =C2=A0d1: 0000145e =C2=A0 =C2=A0d2: 00000001 =C2=
=A0 =C2=A0d3: 0024ca2e
>> d4: 0007cc0a =C2=A0 =C2=A0d5: 0007f064 =C2=A0 =C2=A0a0: 0028bdbc =C2=
=A0 =C2=A0a1: 0028bdc0
>> Process pidof (pid: 1014, task=3D10951030)
>> Frame format=3D0
>> Stack from 10977ef8:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 00243288 0024b83b 0000029e 0024b847 1043=
3d14 f000004e 10433d6c 00000001
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 0024ca2e 0080d33e 00000003 00000000 0000=
0004 eff06a74 0080d200 0007d37c
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 00207834 eff069f8 0007d598 00a01694 0080=
d200 0028ecc6 0006fc7e 0080d200
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 0080d200 0028ecc6 c010d7a8 0006fd64 0080=
d200 10965f00 0007048a 0080d200
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 0080d23a 1082c4d0 10965f40 0006bdd6 0080=
d200 1082c4d0 10965f00 1082c4d0
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 10965f00 ffffffef 1082c4d0 10965f04 0006=
be54 1082c4d0 10965f00 80005650
>> Call Trace: [<0007d37c>] shrink_dcache_for_umount_subtree+0x0/0x1f2
>> =C2=A0[<0007d598>] shrink_dcache_for_umount+0x2a/0x62
>> =C2=A0[<0006fc7e>] generic_shutdown_super+0x1a/0xb0
>> =C2=A0[<0006fd64>] kill_anon_super+0x18/0x3c
>> =C2=A0[<0007048a>] deactivate_super+0x5a/0x78
>> =C2=A0[<0006bdd6>] filp_close+0x72/0x90
>> =C2=A0[<0006be54>] sys_close+0x60/0x88
>> =C2=A0[<00002662>] syscall+0x8/0xc
>>
>> This is triggered by pidof when it close the file after reading one =
of
>> the /proc/$pid/stat files.
>
> Reverting 86acdca1b63e6890540fa19495cfc708beff3d8b (fix
> autofs/afs/etc. magic mountpoint breakage) fixes that.
>
> Any idea?

Was this ever fixed?

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
