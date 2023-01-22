Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3112C25B4E
	for <linux-m68k@archiver.kernel.org>; Sun, 22 Jan 2023 16:40:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbjAVQkM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 22 Jan 2023 11:40:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbjAVQkL (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 22 Jan 2023 11:40:11 -0500
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C20E193DE
        for <linux-m68k@vger.kernel.org>; Sun, 22 Jan 2023 08:40:10 -0800 (PST)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pJdO4-0009xt-MN; Sun, 22 Jan 2023 17:40:08 +0100
Received: from p57ae5361.dip0.t-ipconnect.de ([87.174.83.97] helo=[192.168.178.35])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pJdO4-000HGp-Fs; Sun, 22 Jan 2023 17:40:08 +0100
Message-ID: <66b62ba6-7ff3-c156-9dce-dd3f0f0ba114@physik.fu-berlin.de>
Date:   Sun, 22 Jan 2023 17:40:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v13 2/3] m68k: add kernel seccomp support
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k@vger.kernel.org
References: <20230112035529.13521-1-schmitzmic@gmail.com>
 <20230112035529.13521-3-schmitzmic@gmail.com>
 <CAMuHMdUfBkvwME1wNnaMscXA0k9qBrHVi7M8ppkyaJLSiU8S7Q@mail.gmail.com>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <CAMuHMdUfBkvwME1wNnaMscXA0k9qBrHVi7M8ppkyaJLSiU8S7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.174.83.97
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 1/22/23 17:37, Geert Uytterhoeven wrote:
> On Thu, Jan 12, 2023 at 4:55 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> Add secure_computing() call to syscall_trace_enter to actually
>> filter system calls.
>>
>> Add necessary arch Kconfig options, define TIF_SECCOMP trace
>> flag and provide basic seccomp filter support in asm/syscall.h
>>
>> syscall_get_nr currently uses the syscall nr stored in orig_d0
>> because we change d0 to a default return code before starting a
>> syscall trace. This may be inconsistent with syscall_rollback
>> copying orig_d0 to d0 (which we never check upon return from
>> trace). We use d0 for the return code from syscall_trace_enter
>> in entry.S currently, and could perhaps expand that to store
>> a new syscall number returned by the seccomp filter before
>> executing the syscall. This clearly needs some discussion.
>>
>> seccomp_bpf self test on ARAnyM passes 63 out of 89 tests.
>>
>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
> 
> Thanks for your patch!
> 
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> i.e. will queue in the m68k for-v6.3 branch.

Very cool to see this finally getting merged.

Adrian

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

