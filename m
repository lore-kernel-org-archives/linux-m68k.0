From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [git pull] m68k updates for 3.19
Date: Mon, 8 Dec 2014 11:32:18 +0100
Message-ID: <CAMuHMdWSUP=iRsMZD2ZphdGnZy_d6+wKByVZ+RbrpUmvMvjsdA@mail.gmail.com>
References: <1418032337-15218-1-git-send-email-geert@linux-m68k.org>
	<20141208212523.47c3cf35@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20141208212523.47c3cf35@canb.auug.org.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Stephen,

On Mon, Dec 8, 2014 at 11:25 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Mon,  8 Dec 2014 10:52:17 +0100 Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> The following changes since commit cac7f2429872d3733dc3f9915857b1691da2eb2f:
>>
>>   Linux 3.18-rc2 (2014-10-26 16:48:41 -0700)
>>
>> are available in the git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus
>>
>> for you to fetch changes up to f0b99a643e9613beb28af43333bbfa90d4bf85cc:
>>
>>   m68k/mm: Eliminate memset after alloc_bootmem_pages (2014-11-10 09:56:44 +0100)
>
> It looks like this branch has not updated yet (or you forgot to push).
> It is still commit f7bbd12a4b7e088f53f20dd31019984459699fb9 on
> git.kernel.org.

Woops, fixed. Sorry for that.

Actually git tried to tell me, by showing "for-next" instead of "for-linus"
in the output from request-pull, but I choose to ignore that as they're
both pointing to the same commit, and fix that manually. Oh well...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
