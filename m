Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24CFCC7EE29
	for <linux-m68k@archiver.kernel.org>; Tue, 13 Jun 2023 07:06:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240474AbjFMHGL convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 13 Jun 2023 03:06:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240369AbjFMHF5 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 13 Jun 2023 03:05:57 -0400
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F2481718
        for <linux-m68k@lists.linux-m68k.org>; Tue, 13 Jun 2023 00:05:56 -0700 (PDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1q8y6E-002Vbj-Ef; Tue, 13 Jun 2023 09:05:54 +0200
Received: from p57bd9486.dip0.t-ipconnect.de ([87.189.148.134] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1q8y6D-003IFL-Sw; Tue, 13 Jun 2023 09:05:54 +0200
Message-ID: <d4cb71a7a77e8a24d81ab28eea2c3025652101da.camel@physik.fu-berlin.de>
Subject: Re: Status of affs support in the kernel and affstools
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     Artem Bityutskiy <dedekind1@gmail.com>,
        debian-68k <debian-68k@lists.debian.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>
Date:   Tue, 13 Jun 2023 09:05:53 +0200
In-Reply-To: <d062dd7b09006c2d9988d92192952c65e66cf009.camel@gmail.com>
References: <baa520109ab3a13d1ac8aca1c9b8eaeee070c241.camel@physik.fu-berlin.de>
         <d062dd7b09006c2d9988d92192952c65e66cf009.camel@gmail.com>
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

Hi Artem!

On Tue, 2023-06-13 at 09:53 +0300, Artem Bityutskiy wrote:
> I apologize, that message was sent 10 years ago and I do not remember details
> any longer.

No worries, thanks for the quick reply!

> What I do remember is that I was doing some cross-filesystem changes and
> struggled to test AFFS. At that time it felt that AFFS was abandoned. But I
> remember I managed to create an AFFS partition, mount it in Linux, and test my
> changes.

I see. I'm just wondering what other mkfs.affs command you might have found that
you were using there. Maybe Geert or anyone else on this list can remember.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
