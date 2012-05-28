From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [PATCH 11/11 resend] Atari: enable/disable EtherNAT USB interrupt
 in isp116x-hcd
Date: Mon, 28 May 2012 20:50:39 +1200
Message-ID: <CAOmrzk+p3myaUmHyf=UMNMaKNoTiOTrBCV-ZrJEEZdhb-7bo4A@mail.gmail.com>
References: <E1SXMKj-0002YC-7H@zirkon.biophys.uni-duesseldorf.de>
	<CAOmrzkJpDT1oeAaKtdDf2ODcZamijXN0B1ROKyxL-UGP9V7T7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:35412 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751264Ab2E1Iuj (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 28 May 2012 04:50:39 -0400
Received: by dady13 with SMTP id y13so3889482dad.19
        for <linux-m68k@vger.kernel.org>; Mon, 28 May 2012 01:50:39 -0700 (PDT)
In-Reply-To: <CAOmrzkJpDT1oeAaKtdDf2ODcZamijXN0B1ROKyxL-UGP9V7T7Q@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org, geert@linux-m68k.org

Hi Geert,

> the previous patch adding interrupt source enable/disable had a bug
> preventing repeated module loading - please replace by this one.

Forgot again - the entire series should have had

Signed-off-by: Michael Schmitz <schmitz@debian.org>

of course.

  Michael
