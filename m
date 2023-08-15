Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49851C001B0
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Aug 2023 20:44:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238924AbjHOUoM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 15 Aug 2023 16:44:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239968AbjHOUoH (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 15 Aug 2023 16:44:07 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79320D1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Aug 2023 13:43:45 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso773167066b.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Aug 2023 13:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692132192; x=1692736992;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnTtspOTXZe+SCWw8Am40ZERqYHS4QpzmukA+Wjf6JQ=;
        b=XHcTpB5n/de4QdbsBbj08Ui0tbIvN5q/zABFXySxOdHLWswGEEpLHoeYDnItu/q4lv
         w4oRKqbVVw3nm8jJRGGDliyOMN2qGv1XnrxmWocgYfn3pTb4h3kO5gvB5Wi3OdNApWP3
         vIg2u/jjJLuSL5h+OqFnob2mjpTbHul5QNdq3LWlqOT8SdZQjmxoocnTDRg0rae3yBm+
         Nrvqtb1hIuNZS8d6mvhvkQtrIUmYdzRtoW7TlWlv4qMBteg1vTwvWK7ESSYOfRTAHZqI
         e2GfXABAmSI43c+l9igDmv5erEZWiqJfE6HgCWwlY3jf2qBGboXccavSGNRxsCmq/6vf
         /O8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692132192; x=1692736992;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wnTtspOTXZe+SCWw8Am40ZERqYHS4QpzmukA+Wjf6JQ=;
        b=fAcqZsY2fNyZey5waMMkKoiTAUmNYE8TZnNYo6TvjiRVWbDXrmV52ryuOIGdxUgvYH
         XGT5TTvJYfTYtt1rCbnAg+rpcnV5lgPbah5qcRuuHV3dIHVolumiyyXJMm1VnmjA5/3N
         6KsD/W416e4ttNSCL2wTmeuVIpdsZ8feLVTqsgZ70wtrn71gmEdpwfZI0pngz2t4O5+o
         kelzwrkzhaDk/Bol3jBS5Bu3gEf2pMAw+jZma0pso4BRA8Pe0iDxOLvIwrlmrbdYrWTw
         BKO91gz5TIXcgFTtYUfDXFUZJSXXrCvvCZL3GNjfBnYH38ka9CN3T3fSvtXsacCETjsj
         +gvQ==
X-Gm-Message-State: AOJu0YzZ4cX8+ZWyhWbmATFfBX7zK5SicdsaYdZijbQZSLZxvBlAV8Sz
        fUntKxZcqo4sCaqqiG2gB6U=
X-Google-Smtp-Source: AGHT+IG7W9JcTUQyyInRZyWYpwNWFgPXwJohMgSPDfP7GRIuQoCOJbGGgolK+YXRDKvR78FH5pNJBg==
X-Received: by 2002:a17:907:7706:b0:99b:f4b2:6f13 with SMTP id kw6-20020a170907770600b0099bf4b26f13mr11401473ejc.1.1692132192071;
        Tue, 15 Aug 2023 13:43:12 -0700 (PDT)
Received: from ?IPv6:::1? ([2a02:3038:208:d09b:fcc1:cf5c:f917:ae17])
        by smtp.gmail.com with ESMTPSA id kg2-20020a17090776e200b0098f99048053sm7638940ejc.148.2023.08.15.13.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 13:43:11 -0700 (PDT)
Sender: "Richard Z." <richard.zz.ba@gmail.com>
Date:   Tue, 15 Aug 2023 20:43:06 +0000
From:   Richard Z <rz@linux-m68k.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        William R Sowerbutts <will@sowerbutts.com>
CC:     Michael Schmitz <schmitzmic@gmail.com>,
        Finn Thain <fthain@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
In-Reply-To: <CAMuHMdWoK5i+mWf9surp=ZifUCg9F_EYsCpn3X6OnWs1gKCwqA@mail.gmail.com>
References: <68187ca1-1d4f-92f9-f6c7-476caaa24df0@gmail.com> <275c3e98-a8e3-5d2a-13fa-db79ab9d6719@linux-m68k.org> <ZNlYFCVubNgzmUfc@sowerbutts.com> <c8fd631b-226c-4c60-884b-2ffa6437d03f@gmail.com> <ZNoNlC5fhztMFBAk@sowerbutts.com> <edd601bc-56c4-fa33-3a68-285eca768f13@gmail.com> <39D1BBAD-DCA8-4E0E-ACFD-529DECA233B8@linux-m68k.org> <e3964f47-c892-6453-f685-5a06e154f89a@linux-m68k.org> <AFCD9AA4-7A09-4AF5-B3BE-1C5554BFB8D2@linux-m68k.org> <e36baf9d-b027-380c-de91-c9ff52857168@gmail.com> <ZNtKGaIgs4Dy2/6b@sowerbutts.com> <CAMuHMdWoK5i+mWf9surp=ZifUCg9F_EYsCpn3X6OnWs1gKCwqA@mail.gmail.com>
Message-ID: <FA250231-E959-4C06-84DE-229D5A58032C@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org



On August 15, 2023 10:42:02 AM UTC, Geert Uytterhoeven <geert@linux-m68k=
=2Eorg> wrote:
>Hi William,
>
>On Tue, Aug 15, 2023 at 11:49=E2=80=AFAM William R Sowerbutts
><will@sowerbutts=2Ecom> wrote:
>> >We need to fix pata_falcon for Q40, and with data on William's disk in
>> >little endian order, but data on other users' disks in big endian orde=
r, we
>> >need to come up with a way to support both for now=2E
>>
>> I don't mind if you break my disk -- I can always byte-swap it if requi=
red,
>> or patch my kernel to use my preferred byte ordering=2E
>>
>> Valid points have been made about needing to keep existing disks workin=
g=2E
>>
>> For the kernel driver to switch byte order after some specific version =
seems
>> unexpected=2E
>>
>> On the other hand, having disks compatible with other systems is import=
ant,
>> and as a naive new user the byte-swapped disk format was quite unexpect=
ed to
>> me=2E
>>
>> It seems there are reasonable arguments for both sides=2E
>>
>> I had a cursory look through other drivers and could not find any that =
make
>> byte ordering a user-selectable option=2E  Is there any precedent for t=
his?  It
>> would be interesting to learn how they exposed the option to the user=
=2E
>
>IIRC, the consensus was to not add any more byteswapping _options_
>to IDE drivers=2E  Just make sure the driver returns all data in host ord=
er=2E
>The IDE core will take care of converting the drive identification from
>little to native endian when needed (see swap_buf_le16())=2E
>

The more important consensus says don't break things so whoever removed th=
e hdX=3Dbswap option should have implemented it in some other way=2E Howeve=
r there was very little to zero practical use for this at the time that hap=
pened so I can understand why it didn't happen=2E

>Now, if your native (non-Linux) OS byte-swapped only the drive
>identification block, but not the user data, you have an incompatibility=
=2E
>Solving that is meant to be handled through a byte-swapping md layer
>(although I can't seem to find that anymore?)=2E
>

There was some talk about it but iirc it was never implemented=2E


Richard=20
