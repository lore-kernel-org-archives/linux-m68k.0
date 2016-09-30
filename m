From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: migrate exception table users off module.h and onto extable.h
Date: Fri, 30 Sep 2016 10:27:43 +0200
Message-ID: <CAMuHMdU3Z4=Xpag9rRqKZcC72iRUhqdZJhDcqp9e2M2V0A1-0g@mail.gmail.com>
References: <20160919210138.30082-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160919210138.30082-1-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Mon, Sep 19, 2016 at 11:01 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> This file was only including module.h for exception table related
> functions.  We've now separated that content out into its own file
> "extable.h" so now move over to that and avoid all the extra header
> content in module.h that we don't really need to compile this.
>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: linux-m68k@lists.linux-m68k.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Thanks, applied and queued for v4.9.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
