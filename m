From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] selftests/exec: allow shell return code of 126
Date: Mon, 5 Jan 2015 12:35:04 +0100
Message-ID: <CAMuHMdWFoSKB9F969_jUhwHQdPiid8QcjeYOSoE8cS9wHewH7A__5852.03947634927$1420457758$gmane$org@mail.gmail.com>
References: <1420456786-5989-1-git-send-email-drysdale@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1420456786-5989-1-git-send-email-drysdale@google.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: David Drysdale <drysdale@google.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andreas Schwab <schwab@linux-m68k.org>, Shuah Khan <shuahkh@osg.samsung.com>, Andrew Morton <akpm@linux-foundation.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>

On Mon, Jan 5, 2015 at 12:19 PM, David Drysdale <drysdale@google.com> wrote:
> When the shell fails to invoke a script because its path name
> is too long (ENAMETOOLONG), most shells return 127 to indicate
> command not found.  However, some systems report 126 (which POSIX
> suggests should indicate a non-executable file) for this case,
> so allow that too.

Thanks, after this patch, the execveat selftest succeeds on m68k with
Debian 4.0.

> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: David Drysdale <drysdale@google.com>

Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
