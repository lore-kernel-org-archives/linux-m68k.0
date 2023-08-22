Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D212EE49A5
	for <linux-m68k@archiver.kernel.org>; Wed, 23 Aug 2023 02:19:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbjHWCTE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 22 Aug 2023 22:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232208AbjHWCTC (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 22 Aug 2023 22:19:02 -0400
X-Greylist: delayed 903 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Aug 2023 19:18:59 PDT
Received: from symantec4.comsats.net.pk (symantec4.comsats.net.pk [203.124.41.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44FFD185
        for <linux-m68k@lists.linux-m68k.org>; Tue, 22 Aug 2023 19:18:58 -0700 (PDT)
X-AuditID: cb7c291e-055ff70000002aeb-4c-64e5541fabb2
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
        (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by symantec4.comsats.net.pk (Symantec Messaging Gateway) with SMTP id 9E.A2.10987.F1455E46; Wed, 23 Aug 2023 05:34:39 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=LKK4r2euMW2B8QfrKJRQWGeSX1WwkbGAYnwLEmdzioo8Fdghb0hU7i5JFKRwejfTj
          Tjg1k4N2k8pwFum2sC021lG8ku4qfCxsT2TtzGJu3CEFrXEcl8+cHm51lWxXHSOro
          aLzhaCCLB9RTfVlx02Vu42BBn8PwghXUxGhJQZZ9E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=;
        b=M+hu6FxMi8n2te6lv4U2EB6+vzojqRWl3Yrbr1HAhsRw+k0NqWHkbBVUxilBUbj9B
          8jb4ATVFTjo6BzCH/GyZ5lqPI0YCs8qF2gTTDc7ZoCMLlwmZ6WnRniIs3WSgLmCqW
          zY51v89IxaWeW1kJmsMYyDbEoQDR9OBw2M0MTOf/A=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Wed, 23 Aug 2023 04:31:03 +0500
Message-ID: <9E.A2.10987.F1455E46@symantec4.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re; Interest,
To:     linux-m68k@lists.linux-m68k.org
From:   "Chen Yun" <pso.chairmanbod@iesco.com.pk>
Date:   Tue, 22 Aug 2023 16:31:17 -0700
Reply-To: chnyne@gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDLMWRmVeSWpSXmKPExsVyyUKGW1c+5GmKwdw9ChbLn6xldmD0ONn6
        jSWAMYrLJiU1J7MstUjfLoErY8m6CywFu5kr2voXsTQwPmbqYuTgkBAwkdi7VauLkYtDSGAP
        k8S6je9YQBwWgdXMEvt+v2GHcB4yS1y7uYQFoqyZUWLtv49g7bwC1hLTJlV1MXJyMAvoSdyY
        OoUNxOYVEJQ4OfMJC0RcW2LZwtfMIOXMAmoSX7tKQMLCAmISn6YtYwexRQSUJeadmQJmswno
        S6z42swIYrMIqEoc3PSeFcQWEpCS2HhlPdsERv5ZSLbNQrJtFpJtsxC2LWBkWcUoUVyZmwgM
        tWQTveT83OLEkmK9vNQSvYLsTYzAMDxdoym3g3HppcRDjAIcjEo8vD/XPUkRYk0sA+o6xCjB
        wawkwiv9/WGKEG9KYmVValF+fFFpTmrxIUZpDhYlcV5boWfJQgLpiSWp2ampBalFMFkmDk6p
        Bsa13av2KmYYrk9+9NUlRsW6676t5/GeBxbZM8LNPNZcSJWMXnRwlcVT0Y/9tWfv2K7ZaFlY
        djehxWYKc6HJ5iue7q3agtmKauWpUzXu3Jl+MN84gHX6gwnHbt99WfDsyLsDbjG7uWfK53Oe
        eC/I3izZacTZvOVM0KpZF+5yGftXiCV76pnt71ZiKc5INNRiLipOBAAQJ9UePwIAAA==
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Re; Interest,

I am interested in discussing the Investment proposal as I explained
in my previous mail. May you let me know your interest and the
possibility of a cooperation aimed for mutual interest.

Looking forward to your mail for further discussion.

Regards

------
Chen Yun - Chairman of CREC
China Railway Engineering Corporation - CRECG
China Railway Plaza, No.69 Fuxing Road, Haidian District, Beijing, P.R.
China

