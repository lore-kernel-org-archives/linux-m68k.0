From: Joe Perches <joe@perches.com>
Subject: strncmp uses in arch/m68k/sun3/prom/console.c
Date: Mon, 09 Nov 2009 13:48:33 -0800
Message-ID: <1257803313.12852.8.camel@Joe-Laptop.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Roman Zippel <zippel@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org

These might be corrected to sizeof("foo") - 1

arch/m68k/sun3/prom/console.c:          if(strncmp(propb, "serial", sizeof("serial")))
arch/m68k/sun3/prom/console.c:                  strncmp("display", propb, sizeof("display")) == 0)
arch/m68k/sun3/prom/console.c:                  if(strncmp("serial", propb, sizeof("serial")))
