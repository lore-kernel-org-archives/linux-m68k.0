From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 18/21] m68k/sun3/: remove inline marking of EXPORT_SYMBOL functions
Date: Thu, 9 May 2013 13:09:18 +0200
Message-ID: <CAMuHMdX9BiVKHm3ZdMjP1H0DVtGacAahztr+Rn+3epse8EWXZA__48715.2387541302$1368097782$gmane$org@mail.gmail.com>
References: <1368086241-9357-1-git-send-email-yefremov.denis@gmail.com>
	<1368095819-11011-7-git-send-email-yefremov.denis@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1368095819-11011-7-git-send-email-yefremov.denis@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Denis Efremov <yefremov.denis@gmail.com>
Cc: Sam Creasey <sammy@sammy.net>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jiri Kosina <trivial@kernel.org>, ldv-project@linuxtesting.org

On Thu, May 9, 2013 at 12:36 PM, Denis Efremov <yefremov.denis@gmail.com> wrote:
> EXPORT_SYMBOL and inline directives are contradictory to each other.
> The patch fixes this inconsistency.
>
> Found by Linux Driver Verification project (linuxtesting.org).
>
> Signed-off-by: Denis Efremov <yefremov.denis@gmail.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Do you want me to queue this in the m68k tree?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
