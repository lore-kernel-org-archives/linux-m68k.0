Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD2A6C433F5
	for <linux-m68k@archiver.kernel.org>; Thu, 27 Jan 2022 09:09:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234741AbiA0JJh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 27 Jan 2022 04:09:37 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:58909 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234704AbiA0JJg (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Thu, 27 Jan 2022 04:09:36 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1nD0mc-002UK8-R2; Thu, 27 Jan 2022 10:09:34 +0100
Received: from p5b13a6db.dip0.t-ipconnect.de ([91.19.166.219] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1nD0mc-001jIj-J6; Thu, 27 Jan 2022 10:09:34 +0100
Message-ID: <8dffd9fd-37a5-edfe-4e51-00e8bc19379b@physik.fu-berlin.de>
Date:   Thu, 27 Jan 2022 10:09:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v10 0/3] Add kernel seccomp support for m68k
Content-Language: en-US
To:     Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org,
        geert@linux-m68k.org
Cc:     ebiederm@xmission.com, viro@zeniv.linux.org.uk
References: <20220127074158.25888-1-schmitzmic@gmail.com>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <20220127074158.25888-1-schmitzmic@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.166.219
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael!

On 1/27/22 08:41, Michael Schmitz wrote:
> Patch 3 adds the test for TIF_SECCOMP thread info flag to call
> into syscall_trace_enter() when seccomp syscall filtering
> is active, which was missing from earlier versions (classic
> MMU m68k only - need some help with the test for 68000 and
> coldfire).
> 
> The previous version required the TIF_SYSCALL_TRACE
> flag to be set for syscall filtering to work
> 
> The rest of the series remains unchanged from v9. 
> 
> Tested on ARAnyM, 63 out of 89 seccomp_bpf tests now pass
> (33 with the old version).
> 
> I hope you didn't waste too much effort on testing v8/v9, Adrian.
> Should have a suitably large brown paper bag somewhere yet :-(

Sorry, I haven't found the time for the tests yet, I'm really busy at the
moment. If you want to test libsecomp, you can check it out from my Github,
then build it and run the testsuite.

See: https://github.com/glaubitz/libseccomp/tree/m68k

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

