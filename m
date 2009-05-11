From: Lance Tagliapietra <lancetag@Luminet.net>
Subject: gcc parameter for kernel compile
Date: Sun, 10 May 2009 20:52:12 -0500
Message-ID: <20090511015210.GA15777@luminet.net>
Reply-To: lancetag@luminet.net
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from spamtitan.hbci.com ([206.230.105.6]:65212 "EHLO
	spamtitan.hbci.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753229AbZEKCYO (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 10 May 2009 22:24:14 -0400
Received: from localhost (localhost [127.0.0.1])
	by spamtitan.hbci.com (Postfix) with ESMTP id 81E47A19103
	for <linux-m68k@vger.kernel.org>; Sun, 10 May 2009 21:12:58 -0500 (CDT)
Received: from mail.hbci.com (ultra.hbci.com [206.230.105.5])
	by spamtitan.hbci.com (Postfix) with ESMTP id 340B4A18F1A
	for <linux-m68k@vger.kernel.org>; Sun, 10 May 2009 21:12:57 -0500 (CDT)
Received: from tag1amiga.luminet.net (unknown [64.213.220.3])
	by mail.hbci.com (Postfix) with ESMTP id 2C63D2780A9
	for <linux-m68k@vger.kernel.org>; Sun, 10 May 2009 21:12:58 -0500 (CDT)
Received: from lancetag by tag1amiga.luminet.net with local (Exim 3.36 #1 (Debian))
	id 1M3Kgg-0004AB-00
	for <linux-m68k@vger.kernel.org>; Sun, 10 May 2009 20:52:14 -0500
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Hello,

When compiling my m68k linux kernel, gcc is being started with the following first parameters, for example:

gcc -Wp,-MD,sound/oss/dmasound/.dmasound_core.mod.o.d

and all the other objects follow the same pattern.

I am not able to locate -Wp,-MD... in the gcc documentation, any suggestions?

Thanks,

--Lance



