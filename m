From: "Stephen R. Marenka" <stephen@marenka.net>
Subject: patches not upstream
Date: Sun, 24 Oct 2010 17:33:47 -0500
Message-ID: <251136a28833a299adc3df54c1e2bdf4.squirrel@naiad.marenka.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from naiad.marenka.net ([69.164.199.107]:40307 "EHLO
	naiad.marenka.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759138Ab0JXWdt (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 24 Oct 2010 18:33:49 -0400
Received: from localhost (localhost [127.0.0.1])
	by naiad.marenka.net (Postfix) with ESMTP id 849B9C065
	for <linux-m68k@vger.kernel.org>; Sun, 24 Oct 2010 17:33:48 -0500 (CDT)
Received: from naiad.marenka.net ([127.0.0.1])
	by localhost (naiad.marenka.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o0Up0eETqg6O for <linux-m68k@vger.kernel.org>;
	Sun, 24 Oct 2010 17:33:47 -0500 (CDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org


So I'm looking at the patches that are needed in the debian kernel and I
noticed quite a few haven't been sent upstream.

git format-patch -o ../tmp v2.6.36..m68k-v2.6.36 lists 85 patches.

Some of those are already marked for 2.6.37, but the atari/aranym patches
seem to have been sitting around a while. Any chance they can go upstream?
It would simplify debian kernel maintenance immensely.

Thanks,

Stephen

-- 
Stephen R. Marenka     If life's not fun, you're not doing it right!
<stephen@marenka.net>
