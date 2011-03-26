From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [GIT PULL] Core block IO bits for 2.6.39
Date: Sat, 26 Mar 2011 08:21:09 +0100
Message-ID: <AANLkTimy1QZiHtQGUrXLPMRGEy3iXNOB=34tFjgezhEu@mail.gmail.com>
References: <4D8B4A89.80608@fusionio.com>
	<AANLkTi=zJbUpcT+vbLARyxhA34F1se8pYq9No799Zqzh@mail.gmail.com>
	<4D8D87B0.3080107@fusionio.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:61025 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751088Ab1CZHVL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 26 Mar 2011 03:21:11 -0400
In-Reply-To: <4D8D87B0.3080107@fusionio.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Jens Axboe <jaxboe@fusionio.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Mason <chris.mason@oracle.com>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sat, Mar 26, 2011 at 07:29, Jens Axboe <jaxboe@fusionio.com> wrote:
> On 2011-03-25 22:35, Geert Uytterhoeven wrote:
>> On Thu, Mar 24, 2011 at 14:43, Jens Axboe <jaxboe@fusionio.com> wrot=
e:
>>> Jens Axboe (20):
>>> =C2=A0 =C2=A0 =C2=A0block: remove per-queue plugging
>>
>> This one (commit 7eaceaccab5f40bbfda044629a6298616aeaed50) breaks ID=
E
>> on Atari/m68k under ARAnyM. It hangs on:
>>
>> | ide: Falcon IDE controller
>> | Probing IDE interface ide0...
>> | hda: Sarge m68k, ATA DISK drive
>> | ide0 at 0xfff00000 on irq 15 (serialized)
>> | ide-gd driver 1.18
>> | hda: max request size: 128KiB
>> | hda: 2118816 sectors (1084 MB) w/256KiB Cache, CHS=3D2102/16/63
>>
>> The next expected line is the partition parsing:
>>
>> | hda: AHDI hda1 hda2
>
> Geert, does this work for you?

Yep.Thanks!

Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

> diff --git a/drivers/ide/ide-io.c b/drivers/ide/ide-io.c
> index f407784..381017c 100644
> --- a/drivers/ide/ide-io.c
> +++ b/drivers/ide/ide-io.c
> @@ -549,6 +549,9 @@ plug_device_2:
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rq)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blk_requeue_re=
quest(q, rq);
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Use 3ms as that was the old plug delay */
> + =C2=A0 =C2=A0 =C2=A0 blk_delay_queue(q, msecs_to_jiffies(3));
> =C2=A0}
>
> =C2=A0void ide_requeue_and_plug(ide_drive_t *drive, struct request *r=
q)
> @@ -561,6 +564,8 @@ void ide_requeue_and_plug(ide_drive_t *drive, str=
uct request *rq)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rq)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blk_requeue_re=
quest(q, rq);
>
> + =C2=A0 =C2=A0 =C2=A0 /* Use 3ms as that was the old plug delay */
> + =C2=A0 =C2=A0 =C2=A0 blk_delay_queue(q, msecs_to_jiffies(3));
> =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestore(q->queue_lock, flag=
s);
> =C2=A0}
>

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
