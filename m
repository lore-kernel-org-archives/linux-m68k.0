From: Jens Axboe <jaxboe@fusionio.com>
Subject: Re: [GIT PULL] Core block IO bits for 2.6.39
Date: Sat, 26 Mar 2011 09:25:25 +0100
Message-ID: <4D8DA2F5.1050008@fusionio.com>
References: <4D8B4A89.80608@fusionio.com>	<AANLkTi=zJbUpcT+vbLARyxhA34F1se8pYq9No799Zqzh@mail.gmail.com>	<4D8D87B0.3080107@fusionio.com> <AANLkTimy1QZiHtQGUrXLPMRGEy3iXNOB=34tFjgezhEu@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AANLkTimy1QZiHtQGUrXLPMRGEy3iXNOB=34tFjgezhEu@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Mason <chris.mason@oracle.com>, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On 2011-03-26 08:21, Geert Uytterhoeven wrote:
> On Sat, Mar 26, 2011 at 07:29, Jens Axboe <jaxboe@fusionio.com> wrote:
>> On 2011-03-25 22:35, Geert Uytterhoeven wrote:
>>> On Thu, Mar 24, 2011 at 14:43, Jens Axboe <jaxboe@fusionio.com> wrote:
>>>> Jens Axboe (20):
>>>>      block: remove per-queue plugging
>>>
>>> This one (commit 7eaceaccab5f40bbfda044629a6298616aeaed50) breaks IDE
>>> on Atari/m68k under ARAnyM. It hangs on:
>>>
>>> | ide: Falcon IDE controller
>>> | Probing IDE interface ide0...
>>> | hda: Sarge m68k, ATA DISK drive
>>> | ide0 at 0xfff00000 on irq 15 (serialized)
>>> | ide-gd driver 1.18
>>> | hda: max request size: 128KiB
>>> | hda: 2118816 sectors (1084 MB) w/256KiB Cache, CHS=2102/16/63
>>>
>>> The next expected line is the partition parsing:
>>>
>>> | hda: AHDI hda1 hda2
>>
>> Geert, does this work for you?
> 
> Yep.Thanks!

Great! I think we should place those blk_delay_queue() calls under the
if (rq), that should workd to and be more optimal. Can I ask you to
check that, too?

So:

if (rq) {
        blk_requeue_request(q, rq);
        blk_delay_queue(q, msecs_to_jiffies(3));
}

in both locations.

-- 
Jens Axboe
