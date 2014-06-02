From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: gcc -fstack-limit-symbol patches for ColdFile CPU still waiting
 to be applied
Date: Mon, 02 Jun 2014 17:16:00 +1000
Message-ID: <538C24B0.4030806__15653.3258421861$1401693980$gmane$org@uclinux.org>
References: <FC21FA30-ECB6-42D0-AAE5-62D07717B72D@usgs.gov>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <FC21FA30-ECB6-42D0-AAE5-62D07717B72D@usgs.gov>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Larry Baker <baker@usgs.gov>
Cc: uClinux development list <uclinux-dev@uclinux.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>

Hi Larry,

Note that you can no longer get to me on gerg@snapgear.com.
(McAfee shutdown the Snapgear group a couple of years back, and I am no
longer with them. Unfortunately the email address doesn't bounce :-(
Using gerg@uclinux.org is best.


On 01/06/14 07:45, Larry Baker wrote:
> I haven't thought about this in a while, but recent activity on the uClinux developer's list reminded me again to check into this bug.
> 
> A couple years ago I posted patches on gcc bugzilla for gcc 4.6, 4.7, and 4.8 to implement -fstack-limit-symbol for ColdFire processors, as well as to correct the code generated for all m68k processors [1] [2].  I posted an announcement here as well back on 25 September 2012.  The recent conversations here about ColdFire processors made me think someone might still care about that work.
> 
> Merging my patches into the gcc trunk keeps getting deferred.  The last time I had any correspondence with anyone about a time frame, I think the delay was because of the lack of someone working on the m68k code in the compiler.  I've never written any compiler code before this, but I do know how to read assembly language to see what the compiler is emitting.  (That's how I determined the existing implementation was not right and not as efficient as it could be.)  I was able to generate and run my code on uClinux with the stack checking option using my patched gcc.

It is a shame this is taking so long to get back into gcc proper.
But thanks for the good work, and posting it here.

Regards
Greg



> Regards,
> 
> Larry Baker
> US Geological Survey
> 650-329-5608
> baker@usgs.gov
> 
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53834
> [2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=28896
> 
