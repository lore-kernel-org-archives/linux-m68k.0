Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DB7C7EE2E
	for <linux-m68k@archiver.kernel.org>; Tue, 13 Jun 2023 07:22:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234188AbjFMHW5 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 13 Jun 2023 03:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234076AbjFMHW4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 13 Jun 2023 03:22:56 -0400
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD0F5AA
        for <linux-m68k@lists.linux-m68k.org>; Tue, 13 Jun 2023 00:22:55 -0700 (PDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1q8yMf-002c2F-V0; Tue, 13 Jun 2023 09:22:53 +0200
Received: from p57bd9486.dip0.t-ipconnect.de ([87.189.148.134] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1q8yMf-003Lf6-NC; Tue, 13 Jun 2023 09:22:53 +0200
Message-ID: <25787bdeb7560871ebb8678a3f09f62eed418dc4.camel@physik.fu-berlin.de>
Subject: Re: Status of affs support in the kernel and affstools
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     Martin Steigerwald <martin@lichtvoll.de>,
        debian-68k <debian-68k@lists.debian.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Artem Bityutskiy <dedekind1@gmail.com>
Date:   Tue, 13 Jun 2023 09:22:52 +0200
In-Reply-To: <5947812.lOV4Wx5bFT@lichtvoll.de>
References: <baa520109ab3a13d1ac8aca1c9b8eaeee070c241.camel@physik.fu-berlin.de>
         <5947812.lOV4Wx5bFT@lichtvoll.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.3 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.148.134
X-ZEDAT-Hint: PO
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Martin!

On Tue, 2023-06-13 at 09:20 +0200, Martin Steigerwald wrote:
> John Paul Adrian Glaubitz - 13.06.23, 08:47:11 CEST:
> > I was wondering what the current status of the affs driver in the
> > kernel is, did it receive the fixes that Michael(?) was working on? I
> > vaguely remember there were some issues with larger filesystems or so
> > and that someone was working on fixing these issues.
> (...)
> I will reply to the other thread and ask again. Maybe it was just a last 
> question / answer round missing. Or maybe someone else can confirm that 
> the patch indeed went in.

I greatly appreciate that. Thanks a lot for taking care of this!

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
