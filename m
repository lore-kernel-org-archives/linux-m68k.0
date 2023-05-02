Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A162C77B7E
	for <linux-m68k@archiver.kernel.org>; Tue,  2 May 2023 06:48:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233569AbjEBGsm (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 2 May 2023 02:48:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233439AbjEBGsl (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 2 May 2023 02:48:41 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5D8B1A6
        for <linux-m68k@lists.linux-m68k.org>; Mon,  1 May 2023 23:48:39 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id CD3B25C0208;
        Tue,  2 May 2023 02:48:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 02 May 2023 02:48:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:message-id:reply-to:sender
        :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm3; t=1683010116; x=1683096516; bh=2
        G+eRlAJnvcKDhXQGjvWqa+DpSRajURLO0zcHDQqs3k=; b=Vpn9ZGTOpgQ4fMbVM
        wp+z6GjV6KMnYQOxojF0UNhiaLlulgrFvCXkcj8lSpb6fLIZhoqsjvMGGEMvDYu8
        dlcIav2/jrYq138TibFhgsxRdlqgqMYXHb0iPJ1GZGl8tcM+jPxirWKxhPUoaC+E
        bYIbLS8rjUVZ+CZ4ywyO+nGI+H1Bk3DGVZo7y2wPniIYLGil2qZ61vEh6xypml1f
        V17YFQxbruzeYC/TGFNHk6oTRxAKbjB1xQRQ/IQMcA/4PhnXrdNmytDW4dah00XK
        w7OV4p9f3jooJFM7ug/KEzWuohHdZdivv+x3DJIiiOifWONsNpGxFFyOEzUo9+WL
        SWArA==
X-ME-Sender: <xms:RLJQZLAJ_LmkMDjrla_aNgCEv_QrG_hBIOwsprV91sFppIWpI0e04g>
    <xme:RLJQZBhcOne2suDUiD_G0jmUqbvJyhZZxYyEozZn4zDCF41hlcH5EpYbIEifz8uLd
    plhyQzJPO_IF1eHKao>
X-ME-Received: <xmr:RLJQZGkeF-D9v3FuzriltqkdYx9Ck818e90NOVf6TF9Q_cP5Db4y94FMaqIO1y3LlcnqKjD1a_WkZtsfilOu8Vr5pwGRi3jpGA0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvhedgudduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkhffufffvveestddtredttddttdenucfhrhhomhephfhinhhnucfvhhgr
    ihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepheffudekteffudetvdffffehgedtteekkeefvefgieethfevvddtlefhuddutedt
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthh
    grihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:RLJQZNy02Yp9xgpwRla8bOZZPKpwXVdRi53YM3y_alxzigPnHalEjg>
    <xmx:RLJQZARuQ3ZVfOVYvGLN0kOXUDWVj08UA-hAzFWdvx8M_hsHklI_3w>
    <xmx:RLJQZAYMJFTjgQL9BotMCpAR-AA43AsHKpoleI4gCOwu_YQSq0kP0g>
    <xmx:RLJQZLL_hwCjiCcu4jYCglVn0OqZWEvSf6iPUnCh4fqMg8f9eJMpZg>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 May 2023 02:48:33 -0400 (EDT)
Message-Id: <cover.1683010227.git.fthain@linux-m68k.org>
From:   Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH RFC 0/2] 68020/030 signal handling following exceptions
Date:   Tue, 02 May 2023 16:50:27 +1000
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org,
        "Michael Schmitz" <schmitzmic@gmail.com>,
        "Andreas Schwab" <schwab@linux-m68k.org>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

These two patches remedy stack corruption on 68020/030 when delivering
signals following a bus error or (theoretically) an address error.


Finn Thain (2):
  m68k: Don't deliver signals except at instruction boundary
  m68k: Make allowance for signal delivery following an address error

 arch/m68k/kernel/entry.S  |  6 +++++-
 arch/m68k/kernel/signal.c | 13 +++++++++----
 arch/m68k/kernel/traps.c  | 10 ++++++++--
 3 files changed, 22 insertions(+), 7 deletions(-)

-- 
2.37.5

