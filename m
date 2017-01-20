From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] m68k: replaced gcc specific macros with ones from compiler.h
Date: Fri, 20 Jan 2017 11:34:46 +0100
Message-ID: <CAMuHMdXO0yMrePPv_981V2UpA0L66W=aF-c754EtWJfV-hfujQ__16195.8062243231$1484908519$gmane$org@mail.gmail.com>
References: <1484832930-7373-1-git-send-email-gidisrael@gmail.com>
 <201701200401.y4CyY8xU%fengguang.wu@intel.com> <CAMuHMdXkQ6sSw=oQcxUBi0hbZ1_tjc9mx55HvJ1mLPwJoHyDZw@mail.gmail.com>
 <CAPNrq4wfe6Bp1SOjF3nP7=KV2EJtV7dgL5kzmtkYkUfw7wfg4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAPNrq4wfe6Bp1SOjF3nP7=KV2EJtV7dgL5kzmtkYkUfw7wfg4w@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Gideon D'souza <gidisrael@gmail.com>
Cc: kbuild test robot <lkp@intel.com>, "kbuild-all@01.org" <kbuild-all@01.org>, Andrew Morton <akpm@linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>

Hi Gideon,

On Fri, Jan 20, 2017 at 11:21 AM, Gideon D'souza <gidisrael@gmail.com> wrote:
>> Gideon: what exactly did you use to send this email series?
> I used git format-patch and then send-email on my Fedora 24 system.
>
> I did :
>
> git format-patch HEAD^^ # this generated two patches for the two commits I made
> git send-email --to ... ~/patches/0001- .... #sent first patch
> git send-email --to ... ~/patches/0002- ....#sent second patch
>
> Yes, I sent each patch individually. Should I have just passed the directory?

You should pass all patches at once, so they are properly tracked as a
series:

    git send-email --to ... ~/patches/0*

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
