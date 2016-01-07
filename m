From: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: [PATCH v4 00/78] More fixes, cleanup and modernization for NCR5380 drivers
Date: Wed, 06 Jan 2016 21:53:07 -0500
Message-ID: <yq17fjmayng.fsf@sermon.lab.mkp.net>
References: <20160103050501.042035135@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:46766 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752254AbcAGCxQ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 6 Jan 2016 21:53:16 -0500
In-Reply-To: <20160103050501.042035135@telegraphics.com.au> (Finn Thain's
	message of "Sun, 03 Jan 2016 16:05:01 +1100")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org

>>>>> "Finn" == Finn Thain <fthain@telegraphics.com.au> writes:

Finn> Like my previous work on the NCR5380 drivers, this patch series
Finn> has bug fixes, code cleanup and modernization. These drivers
Finn> suffer from mistakes, poor style and neglect and this long series
Finn> addresses the worst of it, covering all ten wrapper drivers and
Finn> both of the core driver forks. The combined size of the drivers is
Finn> reduced by over 700 LoC.

I have staged this for inclusion in a separate branch. Will pull it into
the main queue unless kbuild complains.

http://git.kernel.org/cgit/linux/kernel/git/mkp/scsi.git/log/?h=4.5/ncr5380

-- 
Martin K. Petersen	Oracle Linux Engineering
