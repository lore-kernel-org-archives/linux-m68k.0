From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH v4 00/14] Modernization and fixes for NuBus subsystem
Date: Mon, 8 Jan 2018 13:58:06 +1100 (AEDT)
Message-ID: <alpine.LNX.2.21.1801081107500.3@nippy.intranet>
References: <cover.1513220582.git.fthain@telegraphics.com.au> <CAMuHMdX1Z0y2u1nkj3GqF5N3jYBYvfjM9_jJKH0zM23DBNjhOw@mail.gmail.com> <alpine.LNX.2.21.1801060823160.3@nippy.intranet> <CAMuHMdWnSTLAq+Ec6Ogoqfg-EdkjKzNkBMtL2h0wXUCy9ChFXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWnSTLAq+Ec6Ogoqfg-EdkjKzNkBMtL2h0wXUCy9ChFXg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Sun, 7 Jan 2018, Geert Uytterhoeven wrote:

> it does complain when using spaces only ("please, no spaces at the 
> _start_ of a line").
> 

Checkpatch accepts this tab:

int map(struct mm_id * mm_idp, unsigned long virt, unsigned long len, int prot,
	int phys_fd, unsigned long long offset, int done, void **data)

and this one:

int unlz4(unsigned char *inbuf, long len,
	long (*fill)(void*, unsigned long),

and this combination of tabs and spaces:

void sort(void *base, size_t num, size_t size,
	  int (*cmp_func)(const void *, const void *),

We have no declarations of identifiers shorter than "map" in the kernel, 
as yet, as luck would have it. This would be a violation:

int eq(long __and_complicated_type parameter_a,
       long __and_complicated_type parameter_b,

Unfortunately I don't have a better style checker to offer. So I won't go 
on about simplistic rules or the effect of excess tabs on refactoring, 
readability and re-usability. Suffice it to say that there seems to be 
room for maintainer discretion.

> Do you want to assume maintainership for nubus?
> 

I do intend to take responsibility for any regressions so I might as well 
assume maintainership too. If future patches continue to go through your 
tree, and given there are so few committers, it's just a formality, I 
think.

> check your TABs and spaces again
> 

Will comply.

Thanks.

-- 
