From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] m68k: replaced gcc specific macros with ones from compiler.h
Date: Fri, 20 Jan 2017 08:44:38 +0100
Message-ID: <CAMuHMdXkQ6sSw=oQcxUBi0hbZ1_tjc9mx55HvJ1mLPwJoHyDZw__20846.3484691039$1484898310$gmane$org@mail.gmail.com>
References: <1484832930-7373-1-git-send-email-gidisrael@gmail.com> <201701200401.y4CyY8xU%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <201701200401.y4CyY8xU%fengguang.wu@intel.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: kbuild test robot <lkp@intel.com>
Cc: Gideon Israel Dsouza <gidisrael@gmail.com>, "kbuild-all@01.org" <kbuild-all@01.org>, Andrew Morton <akpm@linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>

On Thu, Jan 19, 2017 at 9:31 PM, kbuild test robot <lkp@intel.com> wrote:
> Hi Gideon,
>
> [auto build test ERROR on m68k/for-next]
> [also build test ERROR on v4.10-rc4 next-20170119]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/Gideon-Israel-Dsouza/compiler-gcc-h-Added-new-macro-for-gcc-attribute/20170120-032332
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-next
> config: m68k-allmodconfig (attached as .config)

Hmm, although Gideon seems to have use git-send-email, there's no
"In-Reply-To" header in the email containing the second patch, hence
the kbuild test robot didn't consider the dependency on the first
patch...

Gideon: what exactly did you use to send this emai series?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
