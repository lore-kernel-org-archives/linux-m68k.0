From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH] m68k/atari: Remove obsolete keyboard_tasklet scheduling
Date: Sun, 31 Aug 2014 21:07:36 +1200
Message-ID: <5402E5D8.6080401__45299.4455736645$1409476086$gmane$org@gmail.com>
References: <1409328896-8457-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1409328896-8457-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Geert
> If CONFIG_VT=n:
>
> arch/m68k/atari/built-in.o: In function `atari_keyboard_interrupt':
> atakeyb.c:(.text+0x1846): undefined reference to `keyboard_tasklet'
> atakeyb.c:(.text+0x1852): undefined reference to `keyboard_tasklet'
>   

Has keyboard_tasklet gone for good, or just been conditionalized on 
CONFIG_VT?

> I think the keyboard_tasklet scheduling is no longer needed, as I
> believe it's handled by drivers/tty/vt/keyboard.c based on events
> received from the input subsystem. So just remove it.
>   

I'd like to test this on real hardware (though ARAnyM does emulate the 
keyboard ACIA IIRC - if you had a working keyboard there I should find 
no different),

Cheers,

    Michael


> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Not tested on real hardware. ARAnyM doesn't have keyboard LEDs.
>
>  arch/m68k/atari/atakeyb.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/m68k/atari/atakeyb.c b/arch/m68k/atari/atakeyb.c
> index 95022b04b62d..1e2be1d34635 100644
> --- a/arch/m68k/atari/atakeyb.c
> +++ b/arch/m68k/atari/atakeyb.c
> @@ -170,7 +170,6 @@ repeat:
>  	if (acia_stat & ACIA_RDRF) {
>  		/* received a character */
>  		scancode = acia.key_data;	/* get it or reset the ACIA, I'll get it! */
> -		tasklet_schedule(&keyboard_tasklet);
>  	interpret_scancode:
>  		switch (kb_state.state) {
>  		case KEYBOARD:
>   
