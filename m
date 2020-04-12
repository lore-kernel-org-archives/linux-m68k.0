Return-Path: <SRS0=j0Rh=54=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECAB2C2BA2B
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Apr 2020 08:32:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C5F9A206DA
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Apr 2020 08:32:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725878AbgDLIcD (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 12 Apr 2020 04:32:03 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:43839 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725832AbgDLIcD (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 12 Apr 2020 04:32:03 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MJmX3-1jhYmt0rtZ-00K87m; Sun, 12 Apr 2020 10:31:58 +0200
Subject: Re: Running m68k on qemu with external initramfs?
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Rob Landley <rob@landley.net>
Cc:     Finn Thain <fthain@telegraphics.com.au>, linux-m68k@vger.kernel.org
References: <0e69cfc4-3bcd-25c3-0d32-665ef50f815c@landley.net>
 <08DCD73D-7BC1-4F38-87DE-ED4DBD5978DA@physik.fu-berlin.de>
From:   Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <f1f62d19-bee9-537d-5641-8435567fb380@vivier.eu>
Date:   Sun, 12 Apr 2020 10:31:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <08DCD73D-7BC1-4F38-87DE-ED4DBD5978DA@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6tzBZr6slNWguDCboKvC9FwpzDVCezV0INAWvbkvi+8XfkWBYnB
 4DAzVXOfKN+l5pWENwfg6bKmI7lY7B+3NKgGzYGcMD1ced8WQp7ffBPiRX/sKUtT/QOSt6B
 QcshDkwrlgE/2buXIkyb99WsM+hjwbQ4Ws7SbpsJgy8YJtIaxJ5VkeOGK8/0reuOSZUelV/
 xuYEJsRhygYhgWTKtfJmw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2UJq4fJcYjM=:NcwIWukoUyzXKSwqw3pUu0
 JPsmPFEfReOwu/snMXSWHYBXuF/B+Wd6U/4QwzGo+oQ5nX1LXFVS+Lbf3EjeCYEUu1ssiAJ8M
 d88W8/1FIG2Mpi2mbdKsDUzW7QyVSbWAp3nIE1sRJ8EVEMfyXPZZvz4Wy7Bs9jtMBoooJJptB
 q94RanU2HUU7M6ZLSxTy4p3oRaLrfMRVvoPCEVfMLLtYcxu4JPiZpLOrIZYzf59O0/sB+aC1K
 SQIDmNjdikGPjTypXJPDlIJvlK3WmekD/wPMm6YPL7FMYiiV71LBU7441tD2Ej4EwwX1pipfW
 jLlv1obiyNF5vgKBFQGXRZLoI/TURTuKHwsKvtCKQDhlNK5UuUNx4w6c5LQodIuQIGy4yRq60
 pYBEiB46ADJsN79AZ0M0BXHHKX/tpd6CUSgO8RWsL2W7DIwyihMDml80ythXNsnWTENc5x1OH
 q8yx5lBnrXzHFa45tFaARArUPzqoXH2ZJJ5AycozAZhF4jx7AFrMt8KhNbpPzZbK5LvWeyB7e
 FS2+6m3VX5o4pFwJsElhpBNyTX1WIU++U83GqelTaum5TFjKVld5feTcqwMvJFfRcj7pJuODj
 w2kOdNt88Cuq6OH5ETgjAUd8SwR4pyGBp2qhlsCVZKN0rsLi0HCcZ0fFTyGqqh55eHBES0I34
 1by8UJoNXsiFZbP4XMFZY+QlbON7QrEBXwHHHPllo5MPEeZJGeeC6xzYoMy1c4VXoSX9Y98jD
 lDdLcsoAILxpTJ707KTnFy7MHFZIs7JwXcfA3FV5qiTibdSBNmN1irHL5YS5Sx9EE9Ywn3Y0a
 COrHklNANtF1956AKc7iN21ZDVzU+sqjqdnjhBB1qqhM+fDoFvKTK+XQg9NGBNaP8X85PTI
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Le 12/04/2020 à 10:27, John Paul Adrian Glaubitz a écrit :
> Hi!
> 
>> On Apr 12, 2020, at 5:31 AM, Rob Landley <rob@landley.net> wrote:
>>
>> ﻿On 4/11/20 1:12 AM, Finn Thain wrote:
>>>> On Fri, 10 Apr 2020, Rob Landley wrote:
>>>>
>>>> I'm adding m68k support to toybox's "make root" target and I have a 
>>>> kernel and a rootfs.cpio.gz, but qemu's -initrd option doesn't put the 
>>>> rootfs image somewhere the m68k kernel can find it.
>>>>
>>>> Is this a "modify qemu" problem or a "modify kernel" problem?
>>>
>>> It sounds more like a "modify kernel .config" problem. But it could be a 
>>> regression; what versions of qemu and kernel did you try?
>>
>> "Works for me", got it. I'll keep digging.
>>
>> QEMU is the one Laurent Vivier maintains that's been out of tree for something
>> like 12 years now, the default branch claims to be "q800-dev" and the last
>> commit was in december. It still runs my old aboriginal linux system image from
>> 2014 (boots to a shell prompt).
> 
> I think most of these things should be merged upstream these days but Laurent probably needs to correct me on what’s missing.

Yes, all is merged in QEMU master for Q800 emulation.

What stays in q800-dev are dev patches needed to run MacOS ROM but
nothing works for the moment.

Thanks,
Laurent
