From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: debian kernel m68k patches for 2.6.28
Date: Mon, 2 Mar 2009 15:45:40 +0100
Message-ID: <10f740e80903020645l510c31c7u9530e20d9b54cb2@mail.gmail.com>
References: <20090301202823.GF13268@marenka.net>
	 <10f740e80903020148i23db9424vd2fa529f6d7a4134@mail.gmail.com>
	 <20090302143747.GG10135@marenka.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20090302143747.GG10135@marenka.net>
Resent-Message-ID: <WZP4SBzHtOH.A.M4G.mE_qJB@liszt>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
To: debian-68k@lists.debian.org
Cc: linux-m68k@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

On Mon, Mar 2, 2009 at 15:37, Stephen R Marenka <stephen@marenka.net> wrote:
> On Mon, Mar 02, 2009 at 10:48:48AM +0100, Geert Uytterhoeven wrote:
>> On Sun, Mar 1, 2009 at 21:28, Stephen R Marenka <stephen@marenka.net> wrote:
>> > The debian 2.6.28 kernel has hit sid, so it's probably time to
>> > update the m68k patches.
>
>> Please note that I no longer maintain the quilt series file. I'm using
>> git only now.
>
> I was wondering if that wasn't true.
>
>> For 2.6.28, there's a separate branch:
>> http://git.kernel.org/?p=linux/kernel/git/geert/linux-m68k.git;a=shortlog;h=m68k-v2.6.28
>>
>> Hmm, I've just noticed this is Linus' v2.6.28 with only a few new m68k
>> patches applied, while I think
>> I intended it to be the master (m68k) branch just after I merged it
>> with v2.6.28, with newer
>> critical patches applied when needed. Oh well...
>
> So what do you recommend for 2.6.28? I'd like to get a functional
> debian kernel in the meantime. Should I start with the quilt patches?

For 2.6.28, using the quilt patches should be OK.
You may want to add the few patches in git branch m68k-v2.6.28, too.

>> But even if it was what I had intended, you'd still have to use `git
>> cherry' to find the m68k-specific commits
>> and import them into Debian. So I should have all changes nicely
>> rebased (and reordered/squashed) against Linus' latest tree, so you
>> can easily export them. This would also help in keeping track what
>> needs to be submitted upstream.
>
> That sounds like a whole new world of workflow to me. So I'll need
> your 2.6.x, linus's 2.6.x, and debian svn to figure out which patches
> need applying?

Yeah, so let's wait for 2.6.29 for reworking the workflow...

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
