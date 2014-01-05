From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH, RFC 01/30] ataflop: fix sleep_on races
Date: Sun, 5 Jan 2014 14:39:33 +1300
Message-ID: <c3caa289fd7fbc6a06aeabb422b17e4c@biophys.uni-duesseldorf.de>
References: <1388664474-1710039-1-git-send-email-arnd@arndb.de> <1388664474-1710039-2-git-send-email-arnd@arndb.de> <CAMuHMdXijU=ga0mYihoF4Ac_7aDMfU9id5matjz1PUW1nO2oYQ@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:55418 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750767AbaAEBjx (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 4 Jan 2014 20:39:53 -0500
Received: by mail-pa0-f44.google.com with SMTP id fa1so17179714pad.31
        for <linux-m68k@vger.kernel.org>; Sat, 04 Jan 2014 17:39:53 -0800 (PST)
In-Reply-To: <CAMuHMdXijU=ga0mYihoF4Ac_7aDMfU9id5matjz1PUW1nO2oYQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, arnd@arndb.de

Geert,

will look at this one as well, thanks.

Cheers,

	Michael

Am 03.01.2014 um 01:27 schrieb Geert Uytterhoeven:

> ---------- Forwarded message ----------
> From: Arnd Bergmann <arnd@arndb.de>
> Date: Thu, Jan 2, 2014 at 1:07 PM
> Subject: [PATCH, RFC 01/30] ataflop: fix sleep_on races
> To: linux-kernel@vger.kernel.org
> Cc: Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>, Geert
> Uytterhoeven <geert@linux-m68k.org>
>
>
> sleep_on() is inherently racy, and has been deprecated for a long time.
> This fixes two instances in the atari floppy driver:
>
> * fdc_wait/fdc_busy becomes an open-coded mutex. We cannot use the
>   regular mutex since it gets released in interrupt context. The
>   open-coded version using wait_event() and cmpxchg() is equivalent
>   to the existing code but does the checks atomically, and we can
>   now safely check the condition with irqs enabled.
>
> * format_wait becomes a completion, which is the natural structure
>   here. The format ioctl waits for the background task to either
>   complete or abort.
>
> This does not attempt to fix the preexisting bug of calling schedule
> with local interrupts disabled.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  drivers/block/ataflop.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/block/ataflop.c b/drivers/block/ataflop.c
> index 0e30c6e..96b629e 100644
> --- a/drivers/block/ataflop.c
> +++ b/drivers/block/ataflop.c
> @@ -68,6 +68,8 @@
>  #include <linux/init.h>
>  #include <linux/blkdev.h>
>  #include <linux/mutex.h>
> +#include <linux/completion.h>
> +#include <linux/wait.h>
>
>  #include <asm/atafd.h>
>  #include <asm/atafdreg.h>
> @@ -301,7 +303,7 @@ module_param_array(UserSteprate, int, NULL, 0);
>  /* Synchronization of FDC access. */
>  static volatile int fdc_busy = 0;
>  static DECLARE_WAIT_QUEUE_HEAD(fdc_wait);
> -static DECLARE_WAIT_QUEUE_HEAD(format_wait);
> +static DECLARE_COMPLETION(format_wait);
>
>  static unsigned long changed_floppies = 0xff, fake_change = 0;
>  #define        CHECK_CHANGE_DELAY      HZ/2
> @@ -608,7 +610,7 @@ static void fd_error( void )
>         if (IsFormatting) {
>                 IsFormatting = 0;
>                 FormatError = 1;
> -               wake_up( &format_wait );
> +               complete(&format_wait);
>                 return;
>         }
>
> @@ -650,9 +652,8 @@ static int do_format(int drive, int type, struct
> atari_format_descr *desc)
>         DPRINT(("do_format( dr=%d tr=%d he=%d offs=%d )\n",
>                 drive, desc->track, desc->head, desc->sect_offset ));
>
> +       wait_event(fdc_wait, cmpxchg(&fdc_busy, 0, 1) == 0);
>         local_irq_save(flags);
> -       while( fdc_busy ) sleep_on( &fdc_wait );
> -       fdc_busy = 1;
>         stdma_lock(floppy_irq, NULL);
>         atari_turnon_irq( IRQ_MFP_FDC ); /* should be already, just to
> be sure */
>         local_irq_restore(flags);
> @@ -706,7 +707,7 @@ static int do_format(int drive, int type, struct
> atari_format_descr *desc)
>         ReqSide  = desc->head;
>         do_fd_action( drive );
>
> -       sleep_on( &format_wait );
> +       wait_for_completion(&format_wait);
>
>         redo_fd_request();
>         return( FormatError ? -EIO : 0 );
> @@ -1229,7 +1230,7 @@ static void fd_writetrack_done( int status )
>                 goto err_end;
>         }
>
> -       wake_up( &format_wait );
> +       complete(&format_wait);
>         return;
>
>    err_end:
> @@ -1497,8 +1498,7 @@ repeat:
>  void do_fd_request(struct request_queue * q)
>  {
>         DPRINT(("do_fd_request for pid %d\n",current->pid));
> -       while( fdc_busy ) sleep_on( &fdc_wait );
> -       fdc_busy = 1;
> +       wait_event(fdc_wait, cmpxchg(&fdc_busy, 0, 1) == 0);
>         stdma_lock(floppy_irq, NULL);
>
>         atari_disable_irq( IRQ_MFP_FDC );
> --
> 1.8.3.2
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" 
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
