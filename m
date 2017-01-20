From: "Gideon D'souza" <gidisrael@gmail.com>
Subject: Re: [PATCH 2/2] m68k: replaced gcc specific macros with ones from compiler.h
Date: Fri, 20 Jan 2017 15:51:26 +0530
Message-ID: <CAPNrq4wfe6Bp1SOjF3nP7=KV2EJtV7dgL5kzmtkYkUfw7wfg4w__15004.6770963401$1484907733$gmane$org@mail.gmail.com>
References: <1484832930-7373-1-git-send-email-gidisrael@gmail.com>
 <201701200401.y4CyY8xU%fengguang.wu@intel.com> <CAMuHMdXkQ6sSw=oQcxUBi0hbZ1_tjc9mx55HvJ1mLPwJoHyDZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXkQ6sSw=oQcxUBi0hbZ1_tjc9mx55HvJ1mLPwJoHyDZw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kbuild test robot <lkp@intel.com>, "kbuild-all@01.org" <kbuild-all@01.org>, Andrew Morton <akpm@linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>

> Gideon: what exactly did you use to send this email series?
I used git format-patch and then send-email on my Fedora 24 system.

I did :

git format-patch HEAD^^ # this generated two patches for the two commits I made
git send-email --to ... ~/patches/0001- .... #sent first patch
git send-email --to ... ~/patches/0002- ....#sent second patch

Yes, I sent each patch individually. Should I have just passed the directory?


On Fri, Jan 20, 2017 at 1:14 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, Jan 19, 2017 at 9:31 PM, kbuild test robot <lkp@intel.com> wrote:
>> Hi Gideon,
>>
>> [auto build test ERROR on m68k/for-next]
>> [also build test ERROR on v4.10-rc4 next-20170119]
>> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>>
>> url:    https://github.com/0day-ci/linux/commits/Gideon-Israel-Dsouza/compiler-gcc-h-Added-new-macro-for-gcc-attribute/20170120-032332
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-next
>> config: m68k-allmodconfig (attached as .config)
>
> Hmm, although Gideon seems to have use git-send-email, there's no
> "In-Reply-To" header in the email containing the second patch, hence
> the kbuild test robot didn't consider the dependency on the first
> patch...
>
> Gideon: what exactly did you use to send this emai series?
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
