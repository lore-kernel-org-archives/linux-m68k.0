Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 904CAC38142
	for <linux-m68k@archiver.kernel.org>; Sat, 28 Jan 2023 22:52:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbjA1Ww5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 28 Jan 2023 17:52:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbjA1Ww4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 28 Jan 2023 17:52:56 -0500
Received: from crane.ash.relay.mailchannels.net (crane.ash.relay.mailchannels.net [23.83.222.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94FA414EA1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 28 Jan 2023 14:52:51 -0800 (PST)
X-Sender-Id: dreamhost|x-authsender|cmhanson@eschatologist.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id 60B776C0A0F;
        Sat, 28 Jan 2023 22:44:13 +0000 (UTC)
Received: from pdx1-sub0-mail-a250.dreamhost.com (unknown [127.0.0.6])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id DC23A6C0626;
        Sat, 28 Jan 2023 22:44:12 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1674945852; a=rsa-sha256;
        cv=none;
        b=1xjAiqg+1iYZyDdML8RyFBH6ZlX4uetJc1L5AmcthjUh/wnnX8mkDTxB3EkkBjDMe/gVj2
        n+J8nqMU3+Rh+xGDuvYcUf/v2AQFu450W3BNPsxfRzNgjQusL9JHbTGSLzT0N0Hh89Uv4v
        fa+pkWPs2TlmHrEYdIWtKzIb5HLQtWRUXc5f4olrO1vlt4w7U7Txox+Q6XSmsppmsmKDBV
        HTnGhQvNhGuE85ICOFFi0vU6HPs0H4yFMIlFLYRIQcrSQdCdkvHu4YJG01UgxfqMN8wTmq
        7BamEqQ/8BlS5t1cFLWWAvmedkIyEU/Ukqlmg4ntIjALWeYEkrhsOAe1Q+Teuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
        s=arc-2022; t=1674945852;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references:dkim-signature;
        bh=j/dD5wNBGX+KcIaw+yUrRWa+Z15NVIaG3jujzyjPh2M=;
        b=PbXjSWsd6vr/ZztQvzc+CoA32pTdhew84Gd1QR6twZguTIt+NjJtsjDSl+S/S01FkiTCGz
        d5Xs+A1gwzY0rGa6POh59lq6qfrxfCF7QVTM5AESG0+Af3pCwXw49QeunSzD/pGuQAgHXR
        zdly3ZSOH3mQVZbohpfzFouq6JdMjC1arK/AnedYEWznT+n5XoAPcxjU756NLCQ8dTU6as
        rIEtkl6QqXYyGwFOy6mw9bCMn1Vvr2cz5EgRHsVVBh4NXQSwYahRgHu+uiWdhaishaZJBU
        RzqtRJZjvz8tcer8Y/T7RS1qhxcTI7CmUwqpnnQnJq1qKZbGHIF1BTDMpfiG6w==
ARC-Authentication-Results: i=1;
        rspamd-544f66f495-m6hr2;
        auth=pass smtp.auth=dreamhost smtp.mailfrom=cmhanson@eschatologist.net
X-Sender-Id: dreamhost|x-authsender|cmhanson@eschatologist.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|cmhanson@eschatologist.net
X-MailChannels-Auth-Id: dreamhost
X-Daffy-Robust: 5f9faab01715b783_1674945853190_495325652
X-MC-Loop-Signature: 1674945853190:2234198976
X-MC-Ingress-Time: 1674945853190
Received: from pdx1-sub0-mail-a250.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
        by 100.103.24.61 (trex/6.7.1);
        Sat, 28 Jan 2023 22:44:13 +0000
Received: from smtpclient.apple (c-76-126-112-162.hsd1.ca.comcast.net [76.126.112.162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cmhanson@eschatologist.net)
        by pdx1-sub0-mail-a250.dreamhost.com (Postfix) with ESMTPSA id 4P48d82rPhz2g;
        Sat, 28 Jan 2023 14:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eschatologist.net;
        s=dreamhost; t=1674945852;
        bh=j/dD5wNBGX+KcIaw+yUrRWa+Z15NVIaG3jujzyjPh2M=;
        h=Content-Type:Subject:From:Date:Cc:Content-Transfer-Encoding:To;
        b=mFsboE7GY9eT/gVJ3jE04YEi8NNcNFn0vh4JKbl7UzbPFtg+rQVl6hRu+GlgZYr8/
         tYF+6dK28aFT4uhxzRCOsGRx15D5mnZjgM+OJE7rYy1i2e+loiRGILq03uKWEGg3vK
         aoSGfllaf6oahctDw8UiP1AOSO7Rb1LwA7MCTKWVXFxHsfF3DqK/d24kd0aP78AzZq
         XvDypy+qbDEquQeQmTn/3x19XI+X4drRlbzT6VxqMWRArk+eQweNU40N0LZKwjgSzF
         obH2BZjvsryy/oMtTtIPcYjAgO3oS5lRNWvpbjOH1W698Kd7FZpfWxhEI38VkwtX8j
         Z0F3bkpqb9NTw==
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: Work on adding TLS support to LLVM on m68k
From:   Chris Hanson <cmhanson@eschatologist.net>
In-Reply-To: <1dfde9d2-250f-dd1b-1775-76917f4b2166@physik.fu-berlin.de>
Date:   Sat, 28 Jan 2023 14:44:01 -0800
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>, port-m68k@netbsd.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E11E3305-75B1-42FD-A839-46CF93DA5785@eschatologist.net>
References: <1dfde9d2-250f-dd1b-1775-76917f4b2166@physik.fu-berlin.de>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

There wasn't really a TLS standard on any 68K ABIs that I know about. If =
the SVR4 ABI for 68K defined one then that's probably the one I'd use =
for LLVM's default, as most everything else should follow the SVR4 ABI =
for 68K by default too, right?

That said, any compiler or linker for 68K needs to support multiple ABI =
standards since Mac OS, Atari, Amiga, and all the different UNIX and =
UNIX-like operating systems had their own ABI. Fortunately LLVM itself =
supports the concept of multiple ABIs=E2=80=A6

  -- Chris

> On Jan 28, 2023, at 12:33 PM, John Paul Adrian Glaubitz =
<glaubitz@physik.fu-berlin.de> wrote:
>=20
> Hello!
>=20
> The maintainers of the m68k backend in LLVM have started initial =
planning for adding
> TLS support. An issue for that has been opened in the LLVM Github =
tracker [1].
>=20
> If anyone can help shed more light on how TLS works on m68k, please =
add your comments
> to this Github issue. Any information on the topic is highly =
appreciated.
>=20
> Thanks,
> Adrian
>=20
>> [1] https://github.com/llvm/llvm-project/issues/60354
>=20
> --=20
> .''`.  John Paul Adrian Glaubitz
> : :' :  Debian Developer
> `. `'   Physicist
>  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

