Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD245C433EF
	for <linux-m68k@archiver.kernel.org>; Fri, 14 Jan 2022 22:51:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbiANWvU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 14 Jan 2022 17:51:20 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:50197 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229905AbiANWvT (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Fri, 14 Jan 2022 17:51:19 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1n8VPh-002u6q-Qs; Fri, 14 Jan 2022 23:51:17 +0100
Received: from p57bd9aec.dip0.t-ipconnect.de ([87.189.154.236] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1n8VPh-001hqD-KR; Fri, 14 Jan 2022 23:51:17 +0100
Message-ID: <81cfe72d-1311-39fc-98c0-894189f3d229@physik.fu-berlin.de>
Date:   Fri, 14 Jan 2022 23:51:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v8 0/3] Add kernel seccomp support for m68k
Content-Language: en-US
To:     Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org,
        geert@linux-m68k.org
Cc:     ebiederm@xmission.com, viro@zeniv.linux.org.uk
References: <20220113010903.720-1-schmitzmic@gmail.com>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <20220113010903.720-1-schmitzmic@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.154.236
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi!

On 1/13/22 02:09, Michael Schmitz wrote:
> Respin of m68k kernel seccomp support, again. 
> 
> I have split the (MMU) m68k switch to syscall_trace_enter()/
> syscall_trace_leave() patch from the patch adding return code
> checks for syscall_trace_enter() as suggested by Al Viro. 
> 
> Patch 1 could now replace Eric's patch 'Stop open coding
> ptrace_report_syscall'.
>  
> Rest of the series remains unchanged.

I will try to test this series within the next days. I'd like to see this
finally getting merged as there is a number of packages in Debian that
depend on libsecomp being available and there currently cannot be built
on m68k.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

