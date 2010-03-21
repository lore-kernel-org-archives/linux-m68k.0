From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] Macintosh: fix brace and trailing statement coding style
	issues in adb-iop.c This is a patch to the adb-iop.c file that cleans up
	brace and trailing statement warnings found by the checkpatch.pl tool.
	Signed-off-by: Michael Beardsworth <m
Date: Sun, 21 Mar 2010 11:15:41 +0100
Message-ID: <10f740e81003210315h640b9918g909ef6ad397afcec@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f46.google.com ([74.125.82.46]:33259 "EHLO
	mail-ww0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752431Ab0CUKPn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 21 Mar 2010 06:15:43 -0400
Received: by wwe15 with SMTP id 15so2645901wwe.19
        for <linux-m68k@vger.kernel.org>; Sun, 21 Mar 2010 03:15:42 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: fthain@telegraphics.com.au
Cc: Brad Boyer <flar@allandria.com>, Michael Beardsworth <mbeards2@uoregon.edu>, benh@kernel.crashing.or, linuxppc-dev@ozlabs.org, Michael Beardsworth <mbeards@mbeards-mbp.lulzzzzzzz.info>, linux-m68k@vger.kernel.org

On Sun, Mar 21, 2010 at 10:16,  <fthain@telegraphics.com.au> wrote:
>> On Tue, Mar 09, 2010 at 01:46:20PM -0800, Michael Beardsworth wrote:
>> >...
>> >
>> > =C2=A0#ifdef DEBUG_ADB_IOP
>> > - =C2=A0 printk("adb_iop_listen %p: rcvd packet, %d bytes: %02X %0=
2X", req,
>> > - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (uint) amsg->count + 2, (uint=
) amsg->flags, (uint) amsg->cmd);
>> > + =C2=A0 printk(KERN_WARNING "adb_iop_listen %p: rcvd packet, %d b=
ytes: %02X %02X",
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 req, (uint) amsg->count + 2, =
(uint) amsg->flags, (uint) amsg->cmd);
>> > =C2=A0 =C2=A0 for (i =3D 0; i < amsg->count; i++)
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(" %02X", (uint) a=
msg->data[i]);
>> > =C2=A0 =C2=A0 printk("\n");
>
>> >...
>> > =C2=A0#ifdef DEBUG_ADB_IOP
>> > - =C2=A0 printk("adb_iop_start %p: sending packet, %d bytes:", req=
, req->nbytes);
>> > + =C2=A0 printk(KERN_WARNING "adb_iop_start %p: sending packet, %d=
 bytes:", req, req->nbytes);
>> > =C2=A0 =C2=A0 for (i =3D 0 ; i < req->nbytes ; i++)
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(" %02X", (uint) r=
eq->data[i]);
>> > =C2=A0 =C2=A0 printk("\n");
>
> KERN_DEBUG is used for debugging messages, not KERN_WARNING.

And that change is not covered by the patch description.

BTW, pr_debug(), these days.

>  int adb_iop_init(void)
>  {
> -       printk("adb: IOP ISM driver v0.4 for Unified ADB.\n");
> +       printk(KERN_MESSAGE "adb: IOP ISM driver v0.4 for Unified ADB=
=2E\n");
>        iop_listen(ADB_IOP, ADB_CHAN, adb_iop_listen, "ADB");
>       return 0;
> }

Not to mention the non-existence of KERN_MESSAGE?

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
