From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] [RFC] m68k: Wire up direct socket calls
Date: Fri, 11 Sep 2015 11:59:18 +0200
Message-ID: <CAMuHMdUpyh9Hi_a6nBoU8TL+L5+yo0hty2+u7urt=zR=YsUxuQ__38221.3563578718$1441965586$gmane$org@mail.gmail.com>
References: <1441533991-23853-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1441533991-23853-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>, Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

On Sun, Sep 6, 2015 at 12:06 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> diff --git a/arch/m68k/include/uapi/asm/unistd.h b/arch/m68k/include/uapi/asm/unistd.h
> index 61fb6cb9d2ae3c66..bf168d5ec3d96d32 100644
> --- a/arch/m68k/include/uapi/asm/unistd.h
> +++ b/arch/m68k/include/uapi/asm/unistd.h
> @@ -361,5 +361,20 @@
>  #define __NR_memfd_create      353
>  #define __NR_bpf               354
>  #define __NR_execveat          355
> +#define __NR_socket            356
> +#define __NR_socketpair                357
> +#define __NR_bind              358
> +#define __NR_connect           359
> +#define __NR_listen            360
> +#define __NR_accept4           361
> +#define __NR_getsockopt                362
> +#define __NR_setsockopt                363
> +#define __NR_getsockname       364
> +#define __NR_getpeername       365
> +#define __NR_sendto            366
> +#define __NR_sendmsg           367
> +#define __NR_recvfrom          368
> +#define __NR_recvmsg           369
> +#define __NR_shutdown          370

Doh, I missed sendmmsg() and recvmmsg(). Will send an update series after
I have added a patch with the direct IPC calls.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
