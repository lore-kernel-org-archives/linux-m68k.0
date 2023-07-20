Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21071EB64DA
	for <linux-m68k@archiver.kernel.org>; Thu, 20 Jul 2023 09:33:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbjGTJdP (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 20 Jul 2023 05:33:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230509AbjGTJcx (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 20 Jul 2023 05:32:53 -0400
Received: from mail.208.org (unknown [183.242.55.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B15BF61BA
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Jul 2023 02:27:37 -0700 (PDT)
Received: from mail.208.org (email.208.org [127.0.0.1])
        by mail.208.org (Postfix) with ESMTP id 4R66m515VyzBRDsM
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Jul 2023 17:27:33 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
        content-transfer-encoding:content-type:message-id:user-agent
        :subject:to:from:date:mime-version; s=dkim; t=1689845252; x=
        1692437253; bh=1X499CdxT5P1lqr15c+OF5JzFt+I0XrCS2YbFWWUkQk=; b=w
        jDACvxP3KWxBV5IT7e9BsiuF+sXlvhW4EvQkHPiLO/gCtVK9ef/tjBRMeCdEMzkQ
        UGojrmtc8G4lkCRH/urprfSV5WmhHHXl0O3x3jOYasQmp6e4rW+NawZmPyWgoTIf
        0tfrBZ/Mmt8Y1qu1BJcob673VV1FKzaon/rZZp1/9SNmr9cbDH+/NaD+oPeMx/xo
        Croh/qUUD+ya4lrrxYArSNy8/E+UOAb82stlaFhextRw3/6C67I55xJaihANDnjD
        s4oCPtA4GRqYX+Wk9UqTRVL0uiMYVSjiaoPHlt5UW5YmU/TlOf4YVq+/IG+mMBH0
        to5DnIjhy2Y2ayCJTfkXA==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
        by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id wXeiUkgOosA0 for <linux-m68k@lists.linux-m68k.org>;
        Thu, 20 Jul 2023 17:27:32 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
        by mail.208.org (Postfix) with ESMTPSA id 4R66m46GppzBHXhQ;
        Thu, 20 Jul 2023 17:27:32 +0800 (CST)
MIME-Version: 1.0
Date:   Thu, 20 Jul 2023 17:27:32 +0800
From:   zhangyongle001@208suo.com
To:     linux-m68k@lists.linux-m68k.org
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH] m68k/q40: ERROR: that open brace { should be on the previous
 line
User-Agent: Roundcube Webmail
Message-ID: <ffeb8965fd61f1e9dc313e0f93884b27@208suo.com>
X-Sender: zhangyongle001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Fix onece occurrences of the checkpatch.pl error:

ERROR: that open brace { should be on the previous line

Signed-off-by: zhangyongle <zhangyongle001@208suo.com>
---
  arch/m68k/q40/config.c | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/m68k/q40/config.c b/arch/m68k/q40/config.c
index c78ee709b458..54bb2388731d 100644
--- a/arch/m68k/q40/config.c
+++ b/arch/m68k/q40/config.c
@@ -146,8 +146,7 @@ static void q40_get_model(char *model)
  	sprintf(model, "Q40");
  }

-static unsigned int serports[] =
-{
+static unsigned int serports[] = {
  	0x3f8,0x2f8,0x3e8,0x2e8,0
  };

-- 
2.40.1

