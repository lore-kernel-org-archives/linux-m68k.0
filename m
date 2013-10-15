From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/3] kexec: Add debug printing of kimage table entries
Date: Tue, 15 Oct 2013 22:03:58 +0200
Message-ID: <CAMuHMdWfk5awf3ycuY0ULyzk-8gc209p0DGDXwYEM2si6KpCuw__32826.8127203502$1381867460$gmane$org@mail.gmail.com>
References: <1381859307-11932-1-git-send-email-geert@linux-m68k.org>
	<1381859307-11932-2-git-send-email-geert@linux-m68k.org>
	<8761sy1gmb.fsf@xmission.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <8761sy1gmb.fsf@xmission.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, kexec@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Oct 15, 2013 at 9:25 PM, Eric W. Biederman
<ebiederm@xmission.com> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>> Print a list of pages to be copied if debugging is enabled.
>> Consecutive entries are merged to reduce screen clutter.
>
> Why is this desirable?
>
> I can understand this as debugging code to understand what is happening,
> but why would we want to maintain this print statement long term?

Because the next person who ports kexec to a new platform may need it,
so he doesn't have to reimplement the wheel?

It's disabled by default.

It also serves as documentation for the indirection page.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
