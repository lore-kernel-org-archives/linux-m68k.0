From: Larry Baker <baker@usgs.gov>
Subject: gcc -fstack-limit-symbol patches for ColdFile CPU still waiting to be applied
Date: Sat, 31 May 2014 14:45:40 -0700
Message-ID: <FC21FA30-ECB6-42D0-AAE5-62D07717B72D__36112.5588221059$1401573090$gmane$org@usgs.gov>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary="Apple-Mail-15-211262411"
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: uClinux development list <uclinux-dev@uclinux.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, greg@uclinux.org

--Apple-Mail-15-211262411
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

Greg,

I haven't thought about this in a while, but recent activity on the =
uClinux developer's list reminded me again to check into this bug.

A couple years ago I posted patches on gcc bugzilla for gcc 4.6, 4.7, =
and 4.8 to implement -fstack-limit-symbol for ColdFire processors, as =
well as to correct the code generated for all m68k processors [1] [2].  =
I posted an announcement here as well back on 25 September 2012.  The =
recent conversations here about ColdFire processors made me think =
someone might still care about that work.

Merging my patches into the gcc trunk keeps getting deferred.  The last =
time I had any correspondence with anyone about a time frame, I think =
the delay was because of the lack of someone working on the m68k code in =
the compiler.  I've never written any compiler code before this, but I =
do know how to read assembly language to see what the compiler is =
emitting.  (That's how I determined the existing implementation was not =
right and not as efficient as it could be.)  I was able to generate and =
run my code on uClinux with the stack checking option using my patched =
gcc.

Regards,

Larry Baker
US Geological Survey
650-329-5608
baker@usgs.gov

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D53834
[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D28896


--Apple-Mail-15-211262411
Content-Disposition: attachment; filename*0="[uClinux-dev] Implemented GCC
 stack limit checking for Freescale";
	filename*1=" ColdFire processors.eml"
Content-Type: message/rfc822; name="[uClinux-dev] Implemented GCC stack limit
 checking for Freescale ColdFire processors.eml"
Content-Transfer-Encoding: 7bit

Received: from gscamnls01.wr.usgs.gov ([130.118.4.108])          by
 gscamnlh01.wr.usgs.gov (Lotus Domino Release 8.5.3HF42)          with ESMTP
 id 2012092513510838-208708 ;          Tue, 25 Sep 2012 13:51:08 -0700
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ap4EAPAXYlBCC0Qt/2dsb2JhbABCA79tgiIGAQEVIgwIAh4OAwECBgI+AggIAwEjCjQLBRgEh2QLqGuQYYsvgwgFgkBgA4hXjQ+BFYRMikeDB4E7
X-IronPort-AV: E=Sophos;i="4.80,485,1344236400";
   d="scan'208";a="484551987"
Received: from mail.uclinux.org (HELO uclinux.org) ([66.11.68.45])  by
 gscamnls01.wr.usgs.gov with ESMTP; 25 Sep 2012 13:51:07 -0700
Received: from [127.0.0.1] (localhost [127.0.0.1])	by uclinux.org (Postfix)
 with ESMTP id 4702E1A4084F;	Tue, 25 Sep 2012 16:53:07 -0400 (EDT)
X-Original-To: uclinux-dev@uclinux.org
Delivered-To: uclinux-dev@uclinux.org
Received: from gscamnlh01.wr.usgs.gov (gscamnlh01.wr.usgs.gov [130.118.9.68])
 by uclinux.org (Postfix) with ESMTP id 6DAF11A40844 for
 <uclinux-dev@uclinux.org>; Tue, 25 Sep 2012 16:53:04 -0400 (EDT)
Received: from savaii.wr.usgs.gov ([130.118.45.7]) by gscamnlh01.wr.usgs.gov
 (Lotus Domino Release 8.5.3HF42) with ESMTP id 2012092513505208-208691 ; Tue,
 25 Sep 2012 13:50:52 -0700
From: Larry Baker <baker@usgs.gov>
Date: Tue, 25 Sep 2012 13:50:49 -0700
Message-ID: <E09EA033-3553-4F7B-8E11-CD7AE0FBBE75@usgs.gov>
To: <uclinux-dev@uclinux.org>
MIME-Version: 1.0 (Apple Message framework v1085)
X-Mailer: Apple Mail (2.1085)
X-MIMETrack: Itemize by SMTP Server on gscamnlh01/SERVER/USGS/DOI(Release 8.5.3HF42 | November
 1, 2011) at 09/25/2012 13:50:52,
	Serialize by Router on gscamnlh01/SERVER/USGS/DOI(Release 8.5.3HF42 | November
 1, 2011) at 09/25/2012 13:50:52,
	Serialize complete at 09/25/2012 13:50:52,
	Itemize by SMTP Server on gscamnlh01/SERVER/USGS/DOI(Release 8.5.3HF42 | November
 1, 2011) at 09/25/2012 13:51:08,
	Serialize by Router on gscamnlm03/SERVER/USGS/DOI(Release 8.5.2FP2HF661 | September
 20, 2011) at 09/25/2012 16:51:08,
	Serialize complete at 09/25/2012 16:51:08,
	Serialize by POP3 Server on gscamnlm02/SERVER/USGS/DOI(Release
 8.5.2FP2HF661 | September 20, 2011) at 09/25/2012 13:58:01,
	Serialize complete at 09/25/2012 13:58:01
Subject: [uClinux-dev] Implemented GCC stack limit checking for Freescale
	ColdFire processors
X-BeenThere: uclinux-dev@uclinux.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
List-Id: uClinux development list <uclinux-dev.uclinux.org>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/options/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Errors-To: uclinux-dev-bounces@uclinux.org
Sender: <uclinux-dev-bounces@uclinux.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"

See my posting at http://gcc.gnu.org/bugzilla/show_bug.cgi?id=28896, Bug 28896 - -fstack-limit-symbol and m68k and non 68020.

I implemented GCC stack limit checking for Freescale ColdFire processors (bug no. 28896) and fixed the issues I identified in the existing source code (bug nos. 53833 and 54584).

There are patch files and instructions to build Sourcery (Mentor Graphics) CodeBench Lite for ColdFire uClinux GCC 6.1-2011.09-23, and the mainline GNU GCC releases 4.6.3, 4.6.4 (prerelease), 4.7.1, 4.7.2 (prerelease), and 4.8.0 (experimental).

Larry Baker
US Geological Survey
650-329-5608
baker@usgs.gov



_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev

--Apple-Mail-15-211262411--
