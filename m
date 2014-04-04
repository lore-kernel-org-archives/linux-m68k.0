From: Scott Holder <scott@iamscott.net>
Subject: Re: [PATCH 0/4] Atari kernel-in-FastRAM patches, take three
Date: Thu, 03 Apr 2014 23:43:06 -0400
Message-ID: <533E2A4A.2040107@iamscott.net>
References: <1396137686-32678-1-git-send-email-schmitz@debian.org> <8761mvl3jb.fsf@igel.home> <CAOmrzkLWKq_qxmL5wKsGQGvAwNEQCP1QHhkd70vxViAyBoP98g@mail.gmail.com> <87a9c63x1c.fsf@igel.home> <CAOmrzkLbnUYjaEYa3MAccs03J46OWWKtndA3zyE8Kc+Ckr2eEg@mail.gmail.com> <87txae2dt4.fsf@igel.home> <20140331235216.GA2109@mail.biophys.uni-duesseldorf.de> <CAMuHMdUeMv1R69vSLv0HZpKEgVpRUG_iMs=61JWVubBsSN7VVA@mail.gmail.com> <alpine.LNX.2.00.1404012153360.16187@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
In-Reply-To: <alpine.LNX.2.00.1404012153360.16187@nippy.intranet>
Resent-Message-ID: <8Y5ah6O5TbO.A.WNB.fpiPTB@bendel>
List-URL: <http://lists.debian.org/debian-68k/>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
To: Finn Thain <fthain@telegraphics.com.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitz@mail.biophys.uni-duesseldorf.de>, Andreas Schwab <schwab@linux-m68k.org>, Michael Schmitz <schmitzmic@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, debian m68k <debian-68k@lists.debian.org>
List-Id: linux-m68k@vger.kernel.org

On 4/1/2014 8:23 AM, Finn Thain wrote:
> On Tue, 1 Apr 2014, Geert Uytterhoeven wrote:
>
>> <snip>
>>
>> Don't know about Mac,
> It may be possible to boot Linux with MacOS running in 24-bit mode, and
> ISTR that this leads to a large number of memory chunks. The Penguin
> documentation says use 32-bit mode (which means installing Mode32 if you
> have old MacOS and old ROMs). The only Mac I have here is running MacOS
> 7.6 so I can't test 24-bit mode. You can see the debug output from Penguin
> below.

I happen to have my crazy PearPC/Mac OS X-booting LC475 still up and 
running with a 7.5.5 system folder on it. I rebooted it into 24-bit mode 
and loading Penguin does give a warning that 32-bit mode works better. 
Attempting to boot generates:

*** Too many memory ranges!!!
Error:
*** setup_ram_mappings() failure - too many mappings

I have a 64mb simm in this LC475; I tried popping it out (leaving me 
with 4mb) and it actually did attempt to unpack the kernel, but there's 
too little memory to do it. I have a bagful of smaller 72-pin simms 
kicking around somewhere; I'll have to dig it out of the closet and try 
it again.

Sadly my IIci is still misbehaving due to bad caps. I do have a working 
840AV here... I believe it should work in 24-bit mode. I don't have any 
older 32-bit unclean Macs of the era when 24-bit was normal to try with 
to see if maybe the memory controller works better.

>
>> but I have some memories of interleaved banks and such...
> There are some Mac models with memory controllers that do interleaving. I
> don't know whether interleaving is relevant here. I'd have to consult the
> Penguin source code to know whether it behaves differently on different
> models.

All I can say here is I ran 2.0-era kernels on a Quadra 840AV which does 
have interleaved RAM way back in the day just fine. I haven't yet gotten 
modern kernels (even the setup that works on the LC475) booting on it 
yet; sadly I'm not much good for coding or debug tracing.

Scott
