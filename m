From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] z2ram: Delete a jump label in z2_init()
Date: Mon, 14 Dec 2015 10:10:57 +0100
Message-ID: <CAMuHMdVfaPCSZ2EX0MdU8uakqmP734d0QpEgWkMfwL8LbVZVxQ@mail.gmail.com>
References: <566ABCD9.1060404@users.sourceforge.net>
	<566B13C1.50907@users.sourceforge.net>
	<566B1542.7040902@users.sourceforge.net>
	<20151214003621.GB718@swordfish>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151214003621.GB718@swordfish>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, LKML <linux-kernel@vger.kernel.org>, Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>, Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@fb.com>, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Mon, Dec 14, 2015 at 1:36 AM, Sergey Senozhatsky
<sergey.senozhatsky.work@gmail.com> wrote:
> Cc Jens, Andrew, Geert
>
> On (12/11/15 19:26), SF Markus Elfring wrote:
>>
>> This issue was detected by using the Coccinelle software.
>>
>> * Let us return directly if a call of the function "register_blkdev" failed.
>>
>> * Remove the jump label "err" then.
>>
>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

>> ---
>>  drivers/block/z2ram.c | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/block/z2ram.c b/drivers/block/z2ram.c
>> index 968f9e5..b07581d 100644
>> --- a/drivers/block/z2ram.c
>> +++ b/drivers/block/z2ram.c
>> @@ -345,9 +345,8 @@ z2_init(void)
>>      if (!MACH_IS_AMIGA)
>>       return -ENODEV;
>>
>> -    ret = -EBUSY;
>>      if (register_blkdev(Z2RAM_MAJOR, DEVICE_NAME))
>> -     goto err;
>> +     return -EBUSY;
>>
>>      ret = -ENOMEM;
>>      z2ram_gendisk = alloc_disk(1);
>> @@ -374,7 +373,6 @@ out_queue:
>>      put_disk(z2ram_gendisk);
>>  out_disk:
>>      unregister_blkdev(Z2RAM_MAJOR, DEVICE_NAME);
>> -err:
>>      return ret;
>>  }
>
> z2ram and zram are different drivers, but the change looks
> ok to me.
>
> z2ram can be improved in many ways, so my question is - do
> people still use it?

I think it's still used.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
