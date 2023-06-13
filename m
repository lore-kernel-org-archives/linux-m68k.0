Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7D8C7EE2E
	for <linux-m68k@archiver.kernel.org>; Tue, 13 Jun 2023 07:21:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238669AbjFMHVj convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 13 Jun 2023 03:21:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234188AbjFMHVi (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 13 Jun 2023 03:21:38 -0400
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82C41C6
        for <linux-m68k@lists.linux-m68k.org>; Tue, 13 Jun 2023 00:21:37 -0700 (PDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1q8yLP-002bVy-Ip; Tue, 13 Jun 2023 09:21:35 +0200
Received: from p57bd9486.dip0.t-ipconnect.de ([87.189.148.134] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1q8yLP-003LTf-7c; Tue, 13 Jun 2023 09:21:35 +0200
Message-ID: <0ff5e13fb2a5f230ca99c2b9ead7dfc8b9aacea6.camel@physik.fu-berlin.de>
Subject: Re: Status of affs support in the kernel and affstools
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     Stefan Reinauer <stefan.k.reinauer@gmail.com>
Cc:     debian-68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Date:   Tue, 13 Jun 2023 09:21:34 +0200
In-Reply-To: <CABq5eXGMA=5U_h3ZbfXt_weZNWh5zviFn3rw9oxS=wFc6d1Vsw@mail.gmail.com>
References: <baa520109ab3a13d1ac8aca1c9b8eaeee070c241.camel@physik.fu-berlin.de>
         <CABq5eXGMA=5U_h3ZbfXt_weZNWh5zviFn3rw9oxS=wFc6d1Vsw@mail.gmail.com>
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

Hi Stefan!

On Tue, 2023-06-13 at 00:15 -0700, Stefan Reinauer wrote:
> I have found amitools from Christian Vogelgsang to be a good tool
> for creating and manipulating affs.

Looks interesting [1] but it doesn't seem to contain any tool for
creating and checking AFFS filesystems.

Adrian

> [1] https://github.com/cnvogelg/amitools

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
