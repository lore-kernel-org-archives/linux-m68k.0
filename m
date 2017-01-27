From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH 2/2] m68k: replaced gcc specific macros with ones from compiler.h
Date: Fri, 27 Jan 2017 11:39:12 -0500
Message-ID: <CAP=VYLobUppjdMpeoQ7gXn60zmbEZU6d5Ga1mccCPbbpw9n1yA@mail.gmail.com>
References: <1485260068-2495-1-git-send-email-gidisrael@gmail.com> <1485260068-2495-2-git-send-email-gidisrael@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1485260068-2495-2-git-send-email-gidisrael@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Gideon Israel Dsouza <gidisrael@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, gerg@linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Tue, Jan 24, 2017 at 7:14 AM, Gideon Israel Dsouza
<gidisrael@gmail.com> wrote:
> There is <linux/compiler.h> which provides macros for various gcc specific
> constructs. Eg: __weak for __attribute__((weak)). I've cleaned all
> instances of gcc specific attributes with the right macros for all files
> under /arch/m68k
>
> This patch depends on the previous with changes in

> @@ -17,6 +18,6 @@ void nf_init(void);
>  void nf_shutdown(void);
>
>  void nfprint(const char *fmt, ...)
> -       __attribute__ ((format (printf, 1, 2)));
> +       __print(1, 2);
>

You've gone from printf to print here.  This commit is breaking the
linux-next builds on m68k.  I see the kbuild bot tripped over the same
issue and did the same bisect.

http://kisskb.ellerman.id.au/kisskb/buildresult/12916834/

Paul.
--
