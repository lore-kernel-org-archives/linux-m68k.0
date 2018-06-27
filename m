From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v3 00/12] macintosh: Resolve various PMU driver problems
Date: Wed, 27 Jun 2018 17:39:15 +1200
Message-ID: <5d4d7ca4-1d2f-268f-e5d2-eddb213e894d@gmail.com>
References: <cover.1528885172.git.fthain@telegraphics.com.au>
 <alpine.LNX.2.21.1806242119180.34@nippy.intranet>
 <874lhp6i4d.fsf@concordia.ellerman.id.au>
 <cacaecac00c1ac941a78da772bbcfb05142df87d.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cacaecac00c1ac941a78da772bbcfb05142df87d.camel@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Finn Thain <fthain@telegraphics.com.au>, geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

Ben,

Am 27.06.2018 um 15:27 schrieb Benjamin Herrenschmidt:
> On Wed, 2018-06-27 at 13:08 +1000, Michael Ellerman wrote:
>>> I will rewrite patch 10/12 after Arnd's fixes and this series have all
>>> made their way through both powerpc and m68k trees, and submit it
>>> separately.
>>
>> drivers/macintosh is supposedly maintained by Ben, but I'm not sure this
>> series is high on his todo list.
>
> We need at least to pull out a couple of powerbooks we have sitting in
> drawers and try it out.

No need to root around in drawers - I'm sitting in front of one (G3 
Titanium) writing this. Let me know if that would help (I've forgotten 
most of what I knew about powerpc kernels).

Cheers,

	Michael


>
>>
>> Should it just go in via the m68k tree?
>>
>> Or I can create a topic branch to share it between ppc and m68k?
